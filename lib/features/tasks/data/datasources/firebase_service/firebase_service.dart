import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';

class FirebaseService {
  Future<void> createTask({
    required String description,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    tasks.add({
      'description': description,
      'createdAt': DateTime.now(),
    });
  }

  Future<void> deleteTask({
    required String id,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    tasks.doc(id).delete();
  }

  Future<void> updateTask({
    required String description,
  }) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference tasks = firestore.collection('tasks');
    tasks.doc().update({
      'description': description,
    });
  }

  Future<List<TaskModel>> getTasks() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final tasks = firestore.collection('tasks').snapshots();

    return tasks.map((e) {
      return TaskModel.fromJson(e.docs.first.data());
    }).toList();
  }
}
