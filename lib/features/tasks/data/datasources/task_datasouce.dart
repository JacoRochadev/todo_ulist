import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

abstract class ITaskDatasource {
  Future<List<TaskModel>> getTasks();
  Future<void> createTask(String description);
  Future<void> updateTask(String description);
  Future<void> deleteTask(String id);
}
