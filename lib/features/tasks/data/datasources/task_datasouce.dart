import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

abstract class ITaskDatasource {
  Future<(bool, List<TaskModel>)> getTasks();
  Future<TaskEntity> addTask(TaskModel newTask);
  Future<void> updateTask(TaskModel tasksOld, TaskModel tasksNew);
  Future<void> deleteTask(String id);
}
