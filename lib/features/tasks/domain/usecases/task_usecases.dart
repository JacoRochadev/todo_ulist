import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/repositories/tasks_repository.dart';

class TaskUseCases {
  final ITasksRepository _repository;

  TaskUseCases(this._repository);

  Future<(bool, List<TaskModel>)> getTasks() async {
    return await _repository.getTasks();
  }

  Future<bool> addTask(TaskModel newTask) async {
    return await _repository.addTask(newTask);
  }

  Future<void> updateTask(TaskModel tasksOld, TaskModel tasksNew) async {
    return await _repository.updateTask(tasksOld, tasksNew);
  }

  Future<bool> deleteTask(String id) async {
    return await _repository.deleteTask(id);
  }
}
