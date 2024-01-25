import 'package:todo_ulist/features/tasks/data/datasources/firebase_service/firebase_service.dart';
import 'package:todo_ulist/features/tasks/data/datasources/task_datasouce.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

class TaskDatasourceImplementation implements ITaskDatasource {
  final FirebaseService _firebaseService;

  TaskDatasourceImplementation(this._firebaseService);
  @override
  Future<bool> addTask(TaskModel newTask) {
    final result = _firebaseService.addTask(
      newTask: newTask,
    );
    return result;
  }

  @override
  Future<bool> deleteTask(String id) {
    return _firebaseService.deleteTask(id: id);
  }

  @override
  Future<(bool, List<TaskModel>)> getTasks() {
    return _firebaseService.getTasks();
  }

  @override
  Future<void> updateTask(TaskModel tasksOld, TaskModel tasksNew) {
    return _firebaseService.updateTask(
      tasksOld: tasksOld,
      tasksNew: tasksNew,
    );
  }
}
