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
    updatedAt: null,
  );

  tListTaskModel.add(tTaskModel);

  test('should return task model when calls datasource', () async {
    when(() => dataSource.getTasks())
        .thenAnswer((_) async => (false, tListTaskModel));

    final result = await repository.getTasks();

    await expectLater(result, (false, tListTaskModel));

    verify(() => dataSource.getTasks()).called(1);
  });

  final tTaskModelAdd = TaskModel(
    description: 'test repository',
    createdAt: Timestamp.now(),
    updatedAt: null,
  );
  test('should return true when addTask', () async {
    when(() => dataSource.addTask(tTaskModelAdd))
        .thenAnswer((_) async => false);

    final result = await repository.addTask(tTaskModelAdd);

    await expectLater(result, false);

    verify(() => dataSource.addTask(tTaskModelAdd)).called(1);
  });

  test('should delete task', () async {
    when(() => dataSource.deleteTask(tTaskModel.id!))
        .thenAnswer((_) async => true);

    final result = await repository.deleteTask(tTaskModel.id!);

    await expectLater(result, true);

    verify(() => dataSource.deleteTask(tTaskModel.id!)).called(1);
  });

  final tTaskModelOld = TaskModel(
    id: '1',
    description: 'test repository',
    createdAt: Timestamp.now(),
    updatedAt: null,
  );

  final tTaskModelNew = TaskModel(
    id: tTaskModelOld.id,
    description: 'test update',
    createdAt: tTaskModelOld.createdAt,
    updatedAt: Timestamp.now(),
  );

  test('must update the task description', () async {
    when(() => dataSource.updateTask(tTaskModelOld, tTaskModelNew))
        .thenAnswer((_) async => false);

    final result = await repository.updateTask(tTaskModelOld, tTaskModelNew);

    await expectLater(result, false);

    verify(() => dataSource.updateTask(tTaskModelOld, tTaskModelNew)).called(1);
  });
}
