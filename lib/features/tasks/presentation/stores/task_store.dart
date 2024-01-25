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

  @observable
  bool isLoading = false;

  @observable
  ObservableList<TaskModel> filteredTaskList = ObservableList<TaskModel>();

  @action
  void changeTasksList(List<TaskModel> value) =>
      taskList = value.asObservable();

  @action
  void changeIsError(bool value) => isError = value;

  @action
  void changeIsLoading(bool value) => isLoading = value;

  @action
  void updateFilteredTaskList(List<TaskModel> value) =>
      filteredTaskList = value.asObservable();

  @action
  Future<(bool, List<TaskModel>)> getTasks() async {
    changeIsLoading(true);
    final tasks_ = await _useCases.getTasks();
    changeIsError(tasks_.$1);
    changeTasksList(tasks_.$2);
    updateFilteredTaskList(tasks_.$2);
    changeIsLoading(false);
    return tasks_;
  }

  @action
  Future<void> addTask(TaskModel newTask) async {
    final error = await _useCases.addTask(newTask);
    if (error) {
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

  @action
  void searchTasks(String query) {
    final filteredTasks = taskList
        .where((task) =>
            task.description.toLowerCase().contains(query.toLowerCase()))
        .toList();
    updateFilteredTaskList(filteredTasks);
  }
}
