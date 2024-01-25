import 'package:flutter_modular/flutter_modular.dart';
import 'package:todo_ulist/core/presentation/splash_page.dart';
import 'package:todo_ulist/features/tasks/tasks_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      Modular.initialRoute,
      child: (context) => const SplashPage(),
    );

    r.module(
      '/tasks/',
      module: TasksModule(),
    );
  }
}
