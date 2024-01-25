import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

abstract class ITasksRepository {
  Future<List<TaskModel>> getTasks();
  Future<TaskEntity> createTask(String description);
  Future<void> updateTask(TaskEntity tasksOld, TaskEntity tasksNew);
  Future<void> deleteTask(String id);
}
