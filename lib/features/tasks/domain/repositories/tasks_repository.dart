import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

abstract class ITasksRepository {
  Future<List<TaskEntity>> getTasks();
  Future<void> createTask(String description);
  Future<void> updateTask(String description);
  Future<void> deleteTask(String id);
}
