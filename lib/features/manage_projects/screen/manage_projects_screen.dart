import 'package:flutter/material.dart';

class ManageProjectsScreen extends StatelessWidget {
  const ManageProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.background,

      body: Center(
        child: Text(
          "Manage Projects Screen",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: color.onBackground),
        ),
      ),
    );
  }
}
