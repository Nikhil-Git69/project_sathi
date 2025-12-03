import 'package:flutter/material.dart';
import 'package:project_sathi/features/info_dump/screen/developers_note.dart';
import 'package:project_sathi/features/legalities/privacy_policy/screen/privacy_policy_screen.dart';
import 'package:project_sathi/features/legalities/terms_and_conditions/screen/terms_and_conditions_screen.dart';
import 'package:project_sathi/features/theme/theme_screen.dart';
import 'package:project_sathi/core/custom_widgets/coming_soon_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(

      body: ListView(
        padding:  EdgeInsets.all(8.0),
        children: [
           SizedBox(height: 10),
      
          ListTile(
            leading:  Icon(Icons.color_lens),
            title:  Text("Theme"),
            subtitle:  Text("Light / Dark / System"),
            trailing:  Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) =>  ThemeScreen()),
              );
            },
          ),
      
           Divider(),
      
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("About"),
            subtitle: const Text("App version & info"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "ProjectSathi",
                applicationVersion: "1.0.0",
                applicationLegalese: "© 2025 ProjectSathi",
              );
            },
          ),
      
           Divider(),
      
          ListTile(
            leading:  Icon(Icons.feedback_outlined),
            title:  Text("Feedback"),
            subtitle:  Text("Send us your feedback"),
            trailing:  Icon(Icons.arrow_forward_ios),
            onTap: () {
              ComingSoonDialog.show(context, "Feedback");
            },
          ),
      
           Divider(),
      
          ListTile(
            leading:  Icon(Icons.cloud_outlined),
            title:  Text("Backup"),
            subtitle:  Text("Sync your projects to cloud"),
            trailing:  Icon(Icons.arrow_forward_ios),
            onTap: () {
              ComingSoonDialog.show(context, "Cloud / Backup");
            },
          ),

          Divider(),

          ListTile(
            leading:  Icon(Icons.privacy_tip_outlined),
            title:  Text("Privacy Policy"),
            trailing:  Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
            },
          ),   Divider(),

          ListTile(
            leading:  Icon(Icons.article_outlined),
            title:  Text("Terms & Conditions"),
            trailing:  Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => TermsAndConditionsScreen()));
            },
          ),   Divider(),

          ListTile(
            leading:  Icon(Icons.note),
            title:  Text("Developer's Note"),
            trailing:  Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DevelopersNote() ));
            },
          ),
        ],
      ),
    );
  }
}
