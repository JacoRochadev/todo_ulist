import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_ulist/features/tasks/presentation/pages/task_page.dart';

class TasksModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const TaskPage(),
    );
  }
}
