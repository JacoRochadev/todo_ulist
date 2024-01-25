import 'package:mobx/mobx.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_ulist/features/tasks/domain/usecases/task_usecases.dart';

part 'task_store.g.dart';

// ignore: library_private_types_in_public_api
class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store {
  final TaskUseCases _useCases;

  _TaskStoreBase(this._useCases);

  @observable
  ObservableList<TaskEntity> taskList = ObservableList<TaskModel>();

  @action
  void changeTasksList(List<TaskModel> value) =>
      taskList = value.asObservable();

  @action
  Future<void> getTasks() async {
    final tasks_ = await _useCases.getTasks();
    changeTasksList(tasks_);
  }

  @action
  Future<void> addTask(String description) async {
    final TaskEntity task_ = await _useCases.createTask(description);
    taskList.add(task_);
  }

  @action
  Future<void> deleteTask(String id) async {
    _useCases.deleteTask(id);
  }

  @action
  Future<void> updateTaskList(TaskEntity tasksOld, TaskEntity tasksNew) async {
    await _useCases.updateTask(tasksOld, tasksNew);
    final index = taskList.indexOf(tasksOld);
    taskList[index] = tasksNew;
  }
}
