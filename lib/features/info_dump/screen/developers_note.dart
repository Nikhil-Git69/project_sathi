import 'package:flutter/material.dart';

class DevelopersNote extends StatelessWidget {
  const DevelopersNote({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:  Text("About ProjectSathi"),
        backgroundColor: color.primary,
        foregroundColor: color.secondary,

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to ProjectSathi!",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.onBackground,
              ),
            ),
             SizedBox(height: 16),
            Text(
              "ProjectSathi is a simple personal project tracker for learners. "
                  "You can create projects, manage tasks and subtasks, add notes, and track your progress — all offline and free.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color.onBackground,
              ),
            ),
             SizedBox(height: 20),
            Text(
              "Free Version Limitations:",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.onBackground,
              ),
            ),
             SizedBox(height: 8),
            Text(
              "• Up to 3 projects\n"
                  "• Notes and progress tracking available\n"
                  "• No cloud backup (Pro version feature)",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color.onBackground,
              ),
            ),
             SizedBox(height: 20),
            Text(
              "Pro Version (Coming Soon):",
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.onBackground,
              ),
            ),
             SizedBox(height: 8),
            Text(
              "The Pro version will be a one-time purchase and will include unlimited projects, cloud backup, advanced notifications, and more features to boost your productivity. "
                  "If you enjoy using ProjectSathi, your support will help me continue improving the app.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: color.onBackground,
              ),
            ),
             SizedBox(height: 20),
            Text(
              "Developer: EXperTech © 2025",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color.onBackground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
