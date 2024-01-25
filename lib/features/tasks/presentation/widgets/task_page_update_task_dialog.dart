import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_ulist/core/widgets/custom_text_field_widget.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

class TaskPageUpdateTaskDialog extends StatefulWidget {
  const TaskPageUpdateTaskDialog({
    super.key,
    required this.onUpdateTask,
    required this.description,
  });
  final ValueChanged<TaskModel> onUpdateTask;
  final String description;

  static Future<void> show({
    required BuildContext context,
    required ValueChanged<TaskModel> onUpdateTask,
    required String description,
  }) {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return TaskPageUpdateTaskDialog(
          onUpdateTask: onUpdateTask,
          description: description,
        );
      },
    );
  }

  @override
  State<TaskPageUpdateTaskDialog> createState() =>
      _TaskPageUpdateTaskDialogState();
}

class _TaskPageUpdateTaskDialogState extends State<TaskPageUpdateTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String description = '';

  String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  void updateTask() {
    if (!_formKey.currentState!.validate()) return;
    widget.onUpdateTask(
      TaskModel(
        description: description,
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Alterar tarefa',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Form(
        key: _formKey,
        child: CustomTextFieldWidget(
          initialValue: widget.description,
          validator: descriptionValidator,
          hint: 'descrição...',
          keyboardType: TextInputType.text,
          onChanged: (value) {
            description = value;
          },
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
            TextButton(
              onPressed: updateTask,
              child: const Text('Atualizar'),
            ),
          ],
        ),
      ],
    );
  }
}
