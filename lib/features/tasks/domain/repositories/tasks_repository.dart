import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

abstract class ITasksRepository {
  Future<(bool, List<TaskModel>)> getTasks();
  Future<bool> addTask(TaskModel newTask);
  Future<bool> updateTask(TaskModel tasksOld, TaskModel tasksNew);
  Future<bool> deleteTask(String id);
}
