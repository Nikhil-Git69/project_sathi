import 'package:flutter/material.dart';

class UpcomingDeadlineCard extends StatelessWidget {
  final String? projectTitle;
  final DateTime? dueDate;

  /// If null, it means no projects at all
  final bool noProjects;

  const UpcomingDeadlineCard({
    super.key,
    this.projectTitle,
    this.dueDate,
    this.noProjects = false,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    String title;
    String body;
    Color? accentColor;

    if (noProjects) {
      // Case 1: No projects at all
      title = "No Projects Yet";
      body = "Add a project to get started.";
      accentColor = color.primary;
    } else if (projectTitle == null || dueDate == null) {
      // Case 2: Projects exist but none are close
      title = "No Upcoming Deadlines";
      body = "Looks like you’re on track! Keep up the good work.";
      accentColor = color.primary.withOpacity(0.7);
    } else {
      // Case 3: Project due soon
      final now = DateTime.now();
      final daysLeft = dueDate!.difference(now).inDays;

      title = "Upcoming Deadline";
      body =
      daysLeft <= 3
          ? "Hurry! Finish \"$projectTitle\" within $daysLeft day(s)!"
          : "You have $daysLeft day(s) to finish \"$projectTitle\".";

      accentColor = daysLeft <= 3 ? Colors.redAccent : color.primary;
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
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
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            body,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color.onSurface.withOpacity(0.8),
            ),
          ),
          if (dueDate != null)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Text(
                "Due: ${dueDate!.day}-${dueDate!.month}-${dueDate!.year}",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: color.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
