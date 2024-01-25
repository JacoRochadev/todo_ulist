import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/domain/entities/task_entity.dart';

class FirebaseService {
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

  Future<List<TaskModel>> getTasks() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final tasks = firestore.collection('tasks').snapshots();

    return tasks.map((e) {
      return TaskModel.fromJson(e.docs.first.data());
    }).toList();
  }
}
