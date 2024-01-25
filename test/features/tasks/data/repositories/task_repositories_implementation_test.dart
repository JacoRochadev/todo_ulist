import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_ulist/features/tasks/data/datasources/task_datasouce.dart';
import 'package:todo_ulist/features/tasks/data/models/task_model.dart';
import 'package:todo_ulist/features/tasks/data/repositories/task_repository_implementation.dart';

class TaskDataSourceMock extends Mock implements ITaskDatasource {}

void main() {
  late TaskRepositoryImplementation repository;
  late ITaskDatasource dataSource;
  late List<TaskModel> tListTaskModel = [];

  setUp(() {
    dataSource = TaskDataSourceMock();
    repository = TaskRepositoryImplementation(dataSource);
  });

  final tTaskModel = TaskModel(
    id: '1',
    description: 'test repository',
    createdAt: Timestamp.now(),
  );

  tListTaskModel.add(tTaskModel);

  test('should return task model when calls datasource', () async {
    when(() => dataSource.getTasks())
        .thenAnswer((_) async => (true, tListTaskModel));

    final result = await repository.getTasks();

    await expectLater(result, (false, tListTaskModel));

    verify(() => dataSource.getTasks()).called(1);
  });

  test('should return true when addTask', () async {
    when(() => dataSource.addTask(tTaskModel)).thenAnswer((_) async => true);

    final result = await repository.addTask(tTaskModel);

    await expectLater(result, false);

    verify(() => dataSource.addTask(tTaskModel)).called(1);
  });
}
