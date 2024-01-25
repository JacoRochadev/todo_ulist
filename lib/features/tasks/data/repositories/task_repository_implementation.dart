import 'package:todo_ulist/features/tasks/data/datasources/task_datasouce.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';
import 'package:todo_ulist/features/tasks/domain/repositories/tasks_repository.dart';

class TaskRepositoryImplementation implements ITasksRepository {
  final ITaskDatasource _datasource;

  TaskRepositoryImplementation(this._datasource);
  @override
  Future<TaskEntity> addTask(TaskModel newTask) {
    try {
      final result = _datasource.addTask(newTask);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) {
    return _datasource.deleteTask(id);
  }

  @override
  Future<(bool, List<TaskModel>)> getTasks() async {
    final result = await _datasource.getTasks();
    return result;
  }

  @override
  Future<void> updateTask(TaskModel tasksOld, TaskModel tasksNew) {
    try {
      final result = _datasource.updateTask(tasksOld, tasksNew);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
