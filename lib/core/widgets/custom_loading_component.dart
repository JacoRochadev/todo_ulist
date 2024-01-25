import 'package:flutter/material.dart';

class CustomLoadingComponent extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const CustomLoadingComponent({
    super.key,
    this.padding = const EdgeInsets.symmetric(vertical: 15.0),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Carregando tarefas...',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              const SizedBox(
                height: 15,
              ),
              LinearProgressIndicator(
                minHeight: 1.8,
                backgroundColor: Theme.of(context).hoverColor,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
