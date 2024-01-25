import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_ulist/features/tasks/domain/repositories/tasks_repository.dart';

class TaskUseCases {
  final ITasksRepository _repository;

  TaskUseCases(this._repository);

  Future<List<TaskEntity>> getTasks() async {
    return await _repository.getTasks();
  }

  Future<TaskEntity> createTask(String description) async {
    return await _repository.createTask(description);
  }

  Future<void> updateTask(TaskEntity tasksOld, TaskEntity tasksNew) async {
    return await _repository.updateTask(tasksOld, tasksNew);
  }

  Future<void> deleteTask(String id) async {
    return await _repository.deleteTask(id);
  }
}
