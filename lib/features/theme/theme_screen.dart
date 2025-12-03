import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_sathi/core/themes/theme_notifier.dart';


class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
      body: Column(
        children: [
          RadioListTile(
            title:  Text("Light Mode"),
            value: ThemeMode.light,
            groupValue: themeNotifier.themeMode,
            onChanged: (_) => themeNotifier.setLightMode(),
          ),
          RadioListTile(
            title:  Text("Dark Mode"),
            value: ThemeMode.dark,
            groupValue: themeNotifier.themeMode,
            onChanged: (_) => themeNotifier.setDarkMode(),
          ),
          RadioListTile(
            title:  Text("System Mode"),
            value: ThemeMode.system,
            groupValue: themeNotifier.themeMode,
            onChanged: (_) => themeNotifier.setSystemMode(),
          ),
        ],
      ),
    );
  }
}
