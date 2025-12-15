import 'package:flutter/material.dart';
import 'package:project_sathi/features/settings/info_dump/screen/developers_note.dart';
import 'package:project_sathi/features/settings/legalities/privacy_policy/screen/privacy_policy_screen.dart';
import 'package:project_sathi/features/settings/legalities/terms_and_conditions/screen/terms_and_conditions_screen.dart';
import 'package:project_sathi/features/settings/widgets/settings_section.dart';
import 'package:project_sathi/features/settings/widgets/settings_tiles.dart';
import 'package:project_sathi/features/settings/theme/theme_screen.dart';
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
        padding: const EdgeInsets.only(top: 12, bottom: 24),
        children: [

          SettingsSection(
            children: [
              SettingsTile(
                icon: Icons.color_lens,
                title: "Theme",
                subtitle: "Light / Dark / System",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ThemeScreen()));
                },
              ),
            ],
          ),

          SettingsSection(
            children: [
              SettingsTile(
                icon: Icons.info_outline,
                title: "About",
                subtitle: "App version & info",
                onTap: () {
                  showAboutDialog(
                    context: context,
                    applicationName: "ProjectSathi",
                    applicationVersion: "1.0.0",
                  );
                },
              ),
              Divider(height: 1),
              SettingsTile(
                icon: Icons.feedback_outlined,
                title: "Feedback",
                subtitle: "Send us your feedback",
                onTap: () {
                  ComingSoonDialog.show(context, "Feedback");
                },
              ),
            ],
          ),

          SettingsSection(
            children: [
              SettingsTile(
                icon: Icons.privacy_tip_outlined,
                title: "Privacy Policy",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => PrivacyPolicyScreen()));
                },
              ),
              Divider(height: 1),
              SettingsTile(
                icon: Icons.article_outlined,
                title: "Terms & Conditions",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => TermsAndConditionsScreen()));
                },
              ),
            ],
          ),

          SettingsSection(
            children: [
              SettingsTile(
                icon: Icons.note,
                title: "Developer’s Note",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => DevelopersNote()));
                },
              ),
            ],
          ),
        ],
      ),

    );
  }
}
