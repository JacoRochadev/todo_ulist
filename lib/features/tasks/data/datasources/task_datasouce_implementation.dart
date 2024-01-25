import 'package:todo_ulist/features/tasks/data/datasources/firebase_service/firebase_service.dart';
import 'package:todo_ulist/features/tasks/data/datasources/task_datasouce.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

class TaskDatasourceImplementation implements ITaskDatasource {
  final FirebaseService _firebaseService;

  TaskDatasourceImplementation(this._firebaseService);
  @override
  Future<TaskEntity> createTask(String description) {
    final result = _firebaseService.createTask(
      description: description,
    );

    return result;
  }

  @override
  Future<void> deleteTask(String id) {
    return _firebaseService.deleteTask(id: id);
  }

  @override
  Future<List<TaskModel>> getTasks() {
    return _firebaseService.getTasks();
  }

  @override
  Future<void> updateTask(TaskEntity tasksOld, TaskEntity tasksNew) {
    return _firebaseService.updateTask(
      tasksOld: tasksOld,
      tasksNew: tasksNew,
    );
  }
}
