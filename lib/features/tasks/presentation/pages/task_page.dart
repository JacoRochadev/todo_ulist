import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:todo_ulist/core/widgets/custom_list_item_widget.dart';
import 'package:todo_ulist/features/tasks/presentation/stores/task_store.dart';
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
    widget.controller.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To do uList',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
        ),
      ),
      body: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: ListView(
                children: [
                  if (widget.controller.isError)
                    const Center(
                      child: Text('Erro ao carregar as tarefas!'),
                    ),
                  if (widget.controller.taskList.isEmpty)
                    const Center(
                      child: Text('Adicione uma nova tarefa!'),
                    ),
                  ...widget.controller.taskList.map(
                    (element) => CustomListItemComponent(
                        element: element,
                        deleteItem: () async {
                          final result =
                              await widget.controller.deleteTask(element.id!);
                          if (result) {
                            widget.controller.taskList.remove(element);
                          }
                        }),
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
              widget.controller.addTask(value);

              Navigator.pop(context);
              if (widget.controller.isError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Erro ao adicionar a tarefa!'),
                  ),
                );
              }
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
