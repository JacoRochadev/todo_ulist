import 'package:mobx/mobx.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/usecases/task_usecases.dart';

part 'task_store.g.dart';

// ignore: library_private_types_in_public_api
class TaskStore = _TaskStoreBase with _$TaskStore;

abstract class _TaskStoreBase with Store {
  final TaskUseCases _useCases;

  _TaskStoreBase(this._useCases);

  @observable
  ObservableList<TaskModel> taskList = ObservableList<TaskModel>();

  @observable
  bool isError = false;

  @action
  void changeIsError(bool value) => isError = value;

  @action
  void changeTasksList(List<TaskModel> value) =>
      taskList = value.asObservable();

  @action
  Future<(bool, List<TaskModel>)> getTasks() async {
    final tasks_ = await _useCases.getTasks();
    changeIsError(tasks_.$1);
    changeTasksList(tasks_.$2);
    return tasks_;
  }

  @action
  Future<void> addTask(TaskModel newTask) async {
    final error = await _useCases.addTask(newTask);
    if (!error) {
      taskList.add(newTask);
    } else {
      changeIsError(true);
    }
  }

  @action
  Future<bool> deleteTask(String id) async {
    return _useCases.deleteTask(id);
  }

  @action
  Future<bool> updateTask(TaskModel tasksOld, TaskModel tasksNew) async {
    final index = taskList.indexOf(tasksOld);
    taskList[index] = tasksNew;
    final error = await _useCases.updateTask(tasksOld, tasksNew);
    if (error) {
      changeIsError(error);
    }
    return error;
  }
}
