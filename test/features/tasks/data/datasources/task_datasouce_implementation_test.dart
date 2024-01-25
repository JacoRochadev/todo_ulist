import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_ulist/core/firebase_options/firebase_options.dart';
import 'package:todo_ulist/features/tasks/data/datasources/firebase_service/firebase_service.dart';
import 'package:todo_ulist/features/tasks/data/datasources/task_datasouce_implementation.dart';

void main() async {
  late TaskDatasourceImplementation taskDatasourceImplementation;
  late FirebaseService firebaseService;

  setUp(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Firebase.initializeApp();

    firebaseService = FirebaseService();
    taskDatasourceImplementation =
        TaskDatasourceImplementation(firebaseService);
  });

  test('task datasouce implementation ...', () async {
    final result = await taskDatasourceImplementation.getTasks();

    print(result);
  });
}
