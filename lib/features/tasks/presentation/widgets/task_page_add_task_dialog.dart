import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

import '../../../../core/widgets/custom_text_field_widget.dart';

class TaskPageAddTaskDialog extends StatefulWidget {
  const TaskPageAddTaskDialog({
    super.key,
    required this.onAddTask,
  });

  final ValueChanged<TaskModel> onAddTask;

  static Future<void> show({
    required BuildContext context,
    required ValueChanged<TaskModel> onAddTask,
  }) {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return TaskPageAddTaskDialog(
          onAddTask: onAddTask,
        );
      },
    );
  }

  @override
  State<TaskPageAddTaskDialog> createState() => _TaskPageAddTaskDialogState();
}

class _TaskPageAddTaskDialogState extends State<TaskPageAddTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String description = '';

  String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  void addTask() {
    if (!_formKey.currentState!.validate()) return;
    widget.onAddTask(
      TaskModel(
        description: description,
        createdAt: Timestamp.now(),
        updatedAt: null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Nova tarefa',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Form(
        key: _formKey,
        child: CustomTextFieldWidget(
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
              onPressed: addTask,
              child: const Text('Adicionar'),
            ),
          ],
        ),
      ],
    );
  }
}
