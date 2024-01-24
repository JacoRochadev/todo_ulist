import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_ulist/features/tasks/domain/repositories/tasks_repository.dart';

class TaskUseCases {
  final ITasksRepository _repository;

  TaskUseCases(this._repository);

  Future<List<TaskEntity>> getTasks() async {
    return await _repository.getTasks();
  }

  Future<TaskEntity> createTask(TaskEntity task) async {
    return await _repository.createTask(task);
  }

  Future<TaskEntity> updateTask(TaskEntity task) async {
    return await _repository.updateTask(task);
  }

  Future<void> deleteTask(int id) async {
    return await _repository.deleteTask(id);
  }
}
