import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(

      backgroundColor: color.background,
      body: Center(
        child: Text(
          "Home Screen",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: color.onBackground),
        ),
      ),
    );
  }
}
