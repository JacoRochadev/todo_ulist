import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_ulist/features/tasks/presentation/stores/task_store.dart';
import 'package:todo_ulist/features/tasks/presentation/widgets/custom_list_item_widget.dart';
import 'package:todo_ulist/features/tasks/presentation/widgets/home_page_add_task_dialog.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({
    super.key,
    required this.controller,
  });
  final TaskStore controller;

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  void initState() {
    super.initState();
    widget.controller.getAllTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do List'),
      ),
      body: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ListView(
                children: [
                  if (widget.controller.taskList.isEmpty)
                    const Center(
                      child: Text('Adicione uma nova tarefa!'),
                    ),
                  ...widget.controller.taskList.map(
                    (element) => CustomListItemComponent(
                      element: element,
                      deleteItem: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          HomePageTaskDialog.show(
            context: context,
            onAddTask: (value) {
              widget.controller.addTask(value.description);

              Navigator.pop(context);
            },
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
