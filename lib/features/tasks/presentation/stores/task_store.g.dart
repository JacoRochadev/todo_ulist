// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on _TaskStoreBase, Store {
  late final _$taskListAtom =
      Atom(name: '_TaskStoreBase.taskList', context: context);

  @override
  ObservableList<TaskEntity> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<TaskEntity> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$getAllTasksAsyncAction =
      AsyncAction('_TaskStoreBase.getAllTasks', context: context);

  @override
  Future<void> getAllTasks() {
    return _$getAllTasksAsyncAction.run(() => super.getAllTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_TaskStoreBase.addTask', context: context);

  @override
  Future<void> addTask(String description) {
    return _$addTaskAsyncAction.run(() => super.addTask(description));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_TaskStoreBase.deleteTask', context: context);

  @override
  Future<void> deleteTask(String id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(id));
  }

  late final _$updateTaskListAsyncAction =
      AsyncAction('_TaskStoreBase.updateTaskList', context: context);

  @override
  Future<void> updateTaskList(TaskEntity tasksOld, TaskEntity tasksNew) {
    return _$updateTaskListAsyncAction
        .run(() => super.updateTaskList(tasksOld, tasksNew));
  }

  late final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase', context: context);

  @override
  void changeTasksList(List<TaskEntity> value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.changeTasksList');
    try {
      return super.changeTasksList(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList}
    ''';
  }
}
