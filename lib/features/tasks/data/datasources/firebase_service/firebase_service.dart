import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

class FirebaseService {
  final _firestore = FirebaseFirestore.instance;

  Future<List<TaskModel>> getTasks() async {
    List<TaskModel> tasks = [];

    try {
      var querySnapshot = await _firestore
          .collection("tasks")
          .where("description", isNull: false)
          .get();

      for (var docSnapshot in querySnapshot.docs) {
        debugPrint('${docSnapshot.id} => ${docSnapshot.data()}');

        if (docSnapshot.exists) {
          Map<String, dynamic> jsonData = docSnapshot.data();

          TaskModel task = TaskModel.fromJson(jsonData);
          tasks.add(task);
        }
      }

      debugPrint("Successfully completed");
    } catch (e) {
      debugPrint("Error completing: $e");
    }

    return tasks;
  }

  Future<TaskEntity> createTask({
    required String description,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    TaskEntity task = TaskEntity(
      description: description,
      createdAt: Timestamp.now(),
    );
    tasks.add({task});
    return task;
  }

  Future<void> deleteTask({
    required String id,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    tasks.doc(id).delete();
  }

  Future<void> updateTask(
      {required TaskEntity tasksOld, required TaskEntity tasksNew}) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    tasks.doc().update({
      'tasks': tasksNew,
    });
  }

  // Future<List<TaskModel>> getTasks() async {
  //   //TODO: AJUSTAR ISSO AMANHÃ
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   final tasks = firestore.collection('tasks').snapshots();

  //   return tasks.map((e) {
  //     return TaskModel.fromJson(e.docs.first.data());
  //   }).toList();
  // }
}
