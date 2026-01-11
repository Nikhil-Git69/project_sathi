import 'package:flutter/material.dart';
import 'package:project_sathi/constants/paddings.dart';
import 'package:project_sathi/features/home/widgets/active_project_card.dart';
import 'package:project_sathi/features/home/widgets/recent_projects_card.dart';
import 'package:project_sathi/features/home/widgets/upcoming_deadline_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final theme = Theme.of(context);


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPaddings.all16,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              children: [
                ActiveProjectCard(
                  projectName: "Build Flutter App",
                  completedTasks: 7,
                  totalTasks: 11,
                  helperText: "Focus on one feature today!",
                  onTap: () {
                    print("Tapped active project!");
                  },
                ),
                SizedBox(height: 16),
                UpcomingDeadlineCard(),
                SizedBox(height: 16),
                Text(
                  "Recent Projects",
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
            
                RecentProjectCard(
                  projectName: "Study Flutter Widgets",
                  completedTasks: 2,
                  totalTasks: 5,
                  lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
                  onTap: () => print("Tapped recent project 1"),
                ),
                RecentProjectCard(
                  projectName: "Project Sathi Setup",
                  completedTasks: 7,
                  totalTasks: 10,
                  lastUpdated: DateTime.now().subtract(const Duration(days: 2)),
                  onTap: () => print("Tapped recent project 2"),
                ),
                RecentProjectCard(
                  projectName: "Project Sathi Setup",
                  completedTasks: 7,
                  totalTasks: 10,
                  lastUpdated: DateTime.now().subtract(const Duration(days: 2)),
                  onTap: () => print("Tapped recent project 2"),
                ),

                // Optionally add a "See All" static card/button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: InkWell(
                    onTap: () => print("See all projects tapped"),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: color.primary.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "See All Projects",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: color.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            
              ],
            ),
          )
        ),
      ),
    );
  }
}
