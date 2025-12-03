import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:  Text("Terms & Conditions"),
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
      ),
      body: Padding(
        padding:  EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(
            """
1. You may use this app for personal project management purposes only.
2. All data is stored locally; the developer is not responsible for lost or corrupted data.
3. Redistribution or modification without permission is prohibited.
4. By using this app, you accept all terms listed here.
5. EXperTech retains the right to update these terms at any time.
            """,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: color.onBackground,
            ),
          ),
        ),
      ),
    );
  }
}
