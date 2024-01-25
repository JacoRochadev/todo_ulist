import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

abstract class ITasksRepository {
  Future<List<TaskEntity>> getTasks();
  Future<TaskEntity> createTask(String description);
  Future<void> updateTask(TaskEntity tasksOld, TaskEntity tasksNew);
  Future<void> deleteTask(String id);
}
