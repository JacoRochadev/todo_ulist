import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<(bool, List<TaskModel>)> getTasks() async {
    List<TaskModel> tasks = [];
    try {
      var querySnapshot = await _firestore.collection("tasks").get();
      for (var docSnapshot in querySnapshot.docs) {
        if (docSnapshot.exists) {
          var docId = docSnapshot.id;
          Map<String, dynamic> jsonData = docSnapshot.data();
          final newMap = {
            'id': docId,
            ...jsonData,
          };
          TaskModel task = TaskModel.fromJson(newMap);
          tasks.add(task);
        }
      }
      return (false, tasks);
    } catch (e) {
      return (true, tasks);
    }
  }

  Future<bool> addTask({
    required TaskModel newTask,
  }) async {
    try {
      CollectionReference tasks = _firestore.collection('tasks');
      await tasks.add(newTask.toJson());
      return false;
    } catch (e) {
      return true;
    }
  }

  Future<bool> deleteTask({
    required String id,
  }) async {
    try {
      CollectionReference tasks = _firestore.collection('tasks');
      await tasks.doc(id).delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateTask(
      {required TaskModel tasksOld, required TaskModel tasksNew}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    tasks.doc().update({
      'tasks': tasksNew,
    });
  }
}
