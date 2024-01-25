import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

abstract class ITaskDatasource {
  Future<(bool, List<TaskModel>)> getTasks();
  Future<bool> addTask(TaskModel newTask);
  Future<bool> updateTask(TaskModel tasksOld, TaskModel tasksNew);
  Future<bool> deleteTask(String id);
}
