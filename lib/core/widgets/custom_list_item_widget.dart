import 'package:flutter/material.dart';
import 'package:todo_ulist/core/utils/converters/timestamp_to_date_convert.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

typedef CompleteTaskEntityCallback = void Function(TaskEntity, bool);

class CustomListItemWidget extends StatelessWidget {
  const CustomListItemWidget({
    super.key,
    required this.element,
    required this.deleteItem,
    required this.updateItem,
  });

  final TaskEntity element;
  final VoidCallback deleteItem;
  final VoidCallback updateItem;

  @override
  Widget build(BuildContext context) {
    TimestampToDateConvert timestampToDateConvert = TimestampToDateConvert();
    return ListTile(
      title: Text(
        element.description,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
      ),
      subtitle: Text(
        timestampToDateConvert(element.createdAt),
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
            onPressed: updateItem,
          ),
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: deleteItem,
          ),
        ],
      ),
    );
  }
}
