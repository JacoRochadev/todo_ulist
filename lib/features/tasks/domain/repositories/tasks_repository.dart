import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

abstract class ITasksRepository {
  Future<List<TaskEntity>> getTasks();
  Future<TaskEntity> createTask(TaskEntity task);
  Future<TaskEntity> updateTask(TaskEntity task);
  Future<void> deleteTask(int id);
}
