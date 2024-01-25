import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      title: 'To do uList',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 11, 50, 94),
          elevation: 0,
        ),
        primaryColor: const Color.fromARGB(255, 44, 107, 179),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 11, 50, 94),
          foregroundColor: Colors.white,
        ),
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
