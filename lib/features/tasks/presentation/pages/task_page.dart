import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_ulist/core/widgets/custom_list_item_widget.dart';
import 'package:todo_ulist/core/widgets/custom_loading_widget.dart';
import 'package:todo_ulist/features/tasks/presentation/stores/task_store.dart';
import 'package:todo_ulist/features/tasks/presentation/widgets/task_page_add_task_dialog.dart';
import 'package:todo_ulist/features/tasks/presentation/widgets/task_page_update_task_dialog.dart';

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
          return widget.controller.isLoading
              ? const Center(
                  child: CustomLoadingWidget(),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: (widget.controller.isError)
                        ? const Center(
                            child: Text('Erro ao carregar as tarefas!'),
                          )
                        : ListView(
                            children: [
                              if (widget.controller.taskList.isEmpty)
                                const Center(
                                  child: Text('Adicione uma nova tarefa!'),
                                ),
                              ...widget.controller.taskList.map(
                                (element) => CustomListItemWidget(
                                    element: element,
                                    updateItem: () {
                                      TaskPageUpdateTaskDialog.show(
                                        description: element.description,
                                        context: context,
                                        onUpdateTask: (value) async {
                                          await widget.controller
                                              .updateTask(element, value);
                                          await widget.controller.getTasks();

                                          Modular.to.pop();
                                        },
                                      );
                                    },
                                    deleteItem: () async {
                                      final result = await widget.controller
                                          .deleteTask(element.id!);
                                      if (result) {
                                        widget.controller.taskList
                                            .remove(element);
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
          TaskPageAddTaskDialog.show(
            context: context,
            onAddTask: (value) {
              widget.controller.addTask(value);
              widget.controller.getTasks();

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
