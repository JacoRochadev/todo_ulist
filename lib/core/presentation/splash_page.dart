import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../widgets/custom_loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));
      if (!mounted) return;
      Modular.to.pushReplacementNamed('/tasks/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomLoadingWidget(),
      ),
    );
  }
}
