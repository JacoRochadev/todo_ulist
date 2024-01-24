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
          child: LinearProgressIndicator(
            minHeight: 1.8,
            backgroundColor: Theme.of(context).hoverColor,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
