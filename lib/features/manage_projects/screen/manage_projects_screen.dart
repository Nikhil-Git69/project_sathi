import 'package:flutter/material.dart';
import 'package:project_sathi/features/manage_projects/widgets/manage_action_card.dart';

class ManageProjectsScreen extends StatelessWidget {
  const ManageProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header text
              Text(
                "Project Actions",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color.onSurface,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Create, edit, or organize your projects",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: color.onSurface.withOpacity(0.7),
                ),
              ),

              const SizedBox(height: 24),

              // Actions
              ManageActionCard(
                title: "Create Project",
                icon: Icons.add_circle_outline,
                onTap: () {
                  // TODO: Navigate to Create Project screen
                },
              ),

              const SizedBox(height: 16),

              ManageActionCard(
                title: "View All Projects",
                icon: Icons.folder_open,
                onTap: () {
                },
              ),

              const SizedBox(height: 16),

              ManageActionCard(
                title: "Active Project",
                icon: Icons.star_outline,
                onTap: () {
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
