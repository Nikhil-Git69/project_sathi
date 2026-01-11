import 'package:flutter/material.dart';

class RecentProjectCard extends StatelessWidget {
  final String projectName;
  final int completedTasks;
  final int totalTasks;
  final DateTime? lastUpdated; // optional, static for now
  final VoidCallback? onTap;

  const RecentProjectCard({
    super.key,
    required this.projectName,
    required this.completedTasks,
    required this.totalTasks,
    this.lastUpdated,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color.surface,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: color.primary.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Project title
              Text(
                projectName,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.onSurface,
                ),
              ),

              const SizedBox(height: 8),

              // Progress
              Text(
                "$completedTasks / $totalTasks Tasks Completed",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: color.onSurface.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 4),

              // Last updated
              if (lastUpdated != null)
                Text(
                  "Last updated: ${lastUpdated!.day}-${lastUpdated!.month}-${lastUpdated!.year}",
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: color.onSurfaceVariant,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
