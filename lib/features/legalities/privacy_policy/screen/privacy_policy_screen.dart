import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Text(
          """
ProjectSathi (by EXperTech) respects your privacy.

1. Data Storage:
- All your projects, tasks, subtasks, and notes are stored locally on your device.
- No data is transmitted to any server in the free version.

2. No Tracking:
- We do not collect personal data, analytics, or track usage.

3. Optional Pro Version:
- Cloud backup for Pro version will securely store your data if you opt in.
- You will be notified about any data sharing in Pro features.

4. Third-Party Services:
- No third-party services are used in the free version.

By using this app, you agree to the above privacy practices.
""",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: color.onBackground,
          ),
        ),
      ),
    );
  }
}
