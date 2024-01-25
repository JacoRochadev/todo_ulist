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
  ObservableList<TaskModel> get taskList {
    _$taskListAtom.reportRead();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<TaskModel> value) {
    _$taskListAtom.reportWrite(value, super.taskList, () {
      super.taskList = value;
    });
  }

  late final _$isErrorAtom =
      Atom(name: '_TaskStoreBase.isError', context: context);

  @override
  bool get isError {
    _$isErrorAtom.reportRead();
    return super.isError;
  }

  @override
  set isError(bool value) {
    _$isErrorAtom.reportWrite(value, super.isError, () {
      super.isError = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_TaskStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$filteredTaskListAtom =
      Atom(name: '_TaskStoreBase.filteredTaskList', context: context);

  @override
  ObservableList<TaskModel> get filteredTaskList {
    _$filteredTaskListAtom.reportRead();
    return super.filteredTaskList;
  }

  @override
  set filteredTaskList(ObservableList<TaskModel> value) {
    _$filteredTaskListAtom.reportWrite(value, super.filteredTaskList, () {
      super.filteredTaskList = value;
    });
  }

  late final _$getTasksAsyncAction =
      AsyncAction('_TaskStoreBase.getTasks', context: context);

  @override
  Future<(bool, List<TaskModel>)> getTasks() {
    return _$getTasksAsyncAction.run(() => super.getTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('_TaskStoreBase.addTask', context: context);

  @override
  Future<void> addTask(TaskModel newTask) {
    return _$addTaskAsyncAction.run(() => super.addTask(newTask));
  }

  late final _$deleteTaskAsyncAction =
      AsyncAction('_TaskStoreBase.deleteTask', context: context);

  @override
  Future<bool> deleteTask(String id) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(id));
  }

  late final _$updateTaskAsyncAction =
      AsyncAction('_TaskStoreBase.updateTask', context: context);

  @override
  Future<bool> updateTask(TaskModel tasksOld, TaskModel tasksNew) {
    return _$updateTaskAsyncAction
        .run(() => super.updateTask(tasksOld, tasksNew));
  }

  late final _$_TaskStoreBaseActionController =
      ActionController(name: '_TaskStoreBase', context: context);

  @override
  void changeTasksList(List<TaskModel> value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.changeTasksList');
    try {
      return super.changeTasksList(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsError(bool value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.changeIsError');
    try {
      return super.changeIsError(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeIsLoading(bool value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.changeIsLoading');
    try {
      return super.changeIsLoading(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateFilteredTaskList(List<TaskModel> value) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.updateFilteredTaskList');
    try {
      return super.updateFilteredTaskList(value);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchTasks(String query) {
    final _$actionInfo = _$_TaskStoreBaseActionController.startAction(
        name: '_TaskStoreBase.searchTasks');
    try {
      return super.searchTasks(query);
    } finally {
      _$_TaskStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
taskList: ${taskList},
isError: ${isError},
isLoading: ${isLoading},
filteredTaskList: ${filteredTaskList}
    ''';
  }
}
