import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_ulist/features/tasks/data/datasources/firebase_service/firebase_service.dart';
import 'package:todo_ulist/features/tasks/data/datasources/task_datasouce.dart';
import 'package:todo_ulist/features/tasks/data/datasources/task_datasouce_implementation.dart';
import 'package:todo_ulist/features/tasks/data/repositories/task_repository_implementation.dart';
import 'package:todo_ulist/features/tasks/domain/repositories/tasks_repository.dart';
import 'package:todo_ulist/features/tasks/domain/usecases/task_usecases.dart';
import 'package:todo_ulist/features/tasks/presentation/pages/task_page.dart';
import 'package:todo_ulist/features/tasks/presentation/stores/task_store.dart';

class TasksModule extends Module {
  @override
  void binds(i) {
    i.addSingleton<FirebaseService>(FirebaseService.new);
    i.addSingleton<TaskStore>(TaskStore.new);
    i.addSingleton<TaskUseCases>(TaskUseCases.new);
    i.addSingleton<ITasksRepository>(TaskRepositoryImplementation.new);
    i.addSingleton<ITaskDatasource>(TaskDatasourceImplementation.new);
  }

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => TaskPage(
        controller: Modular.get<TaskStore>(),
      ),
    );
  }
}
