import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mycolor = Theme.of(context).colorScheme;

    return Scaffold(

      body: Center(
        child: Text(
          "Home Screen",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: mycolor.onSurface),
        ),
      ),
    );

  }
}
