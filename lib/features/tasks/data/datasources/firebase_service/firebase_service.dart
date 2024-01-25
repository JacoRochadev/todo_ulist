import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<(bool, List<TaskModel>)> getTasks() async {
    List<TaskModel> tasks = [];
    try {
      var querySnapshot = await _firestore.collection("tasks").get();
      for (var docSnapshot in querySnapshot.docs) {
        debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');
        if (docSnapshot.exists) {
          Map<String, dynamic> jsonData = docSnapshot.data();
          TaskModel task = TaskModel.fromJson(jsonData);
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

  Future<void> deleteTask({
    required String id,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    tasks.doc(id).delete();
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
