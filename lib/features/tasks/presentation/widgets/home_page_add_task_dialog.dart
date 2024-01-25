import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

import 'custom_text_field_widget.dart';

class HomePageTaskDialog extends StatefulWidget {
  const HomePageTaskDialog({
    super.key,
    required this.onAddTask,
  });

  final ValueChanged<TaskEntity> onAddTask;

  static Future<void> show({
    required BuildContext context,
    required ValueChanged<TaskEntity> onAddTask,
  }) {
    return showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) {
        return HomePageTaskDialog(
          onAddTask: onAddTask,
        );
      },
    );
  }

  @override
  State<HomePageTaskDialog> createState() => _HomePageTaskDialogState();
}

class _HomePageTaskDialogState extends State<HomePageTaskDialog> {
  final _formKey = GlobalKey<FormState>();
  String name = '';

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }
    return null;
  }

  void addTask() {
    if (!_formKey.currentState!.validate()) return;
    widget.onAddTask(
      TaskEntity(
        description: name,
        createdAt: Timestamp.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Tarefa',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      content: Form(
        key: _formKey,
        child: CustomTextFieldComponent(
          validator: nameValidator,
          hint: 'Digite o nome da tarefa',
          keyboardType: TextInputType.text,
          onChanged: (value) {
            name = value;
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
