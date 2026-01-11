import 'package:flutter/material.dart';

class ActiveProjectCard extends StatelessWidget {
  final String? projectName;
  final int? completedTasks;
  final int? totalTasks;
  final String? helperText;
  final VoidCallback? onTap;

  const ActiveProjectCard({
    super.key,
    this.projectName,
    this.completedTasks,
    this.totalTasks,
    this.helperText,
    this.onTap,
  });

  bool get hasProject => projectName != null && projectName!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
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
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                hasProject ? projectName! : "No Active Project",
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.onSurface,
                ),
              ),

              const SizedBox(height: 8),

              // Progress or suggestion
              Text(
                hasProject
                    ? "$completedTasks/$totalTasks Tasks completed"
                    : "Add one right now or select a project!",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: color.onSurface.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 4),

              // Helper text
              if (hasProject && helperText != null)
                Text(
                  helperText!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: color.onSurface.withOpacity(0.6),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
