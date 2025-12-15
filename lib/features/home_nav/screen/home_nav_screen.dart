import 'package:flutter/material.dart';
import 'package:project_sathi/features/home/screen/home_screen.dart';
import 'package:project_sathi/features/home_nav/widgets/floating_navbar.dart';
import 'package:project_sathi/features/settings/screen/settings_screen.dart';
import 'package:project_sathi/features/manage_projects/screen/manage_projects_screen.dart';


class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreenState();
}

class _HomeNavScreenState extends State<HomeNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens =  [
    HomeScreen(),
    ManageProjectsScreen(),
    SettingsScreen(),
  ];

  final List<String> _titles = [
    "Home",
    "Manage",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0,
      ),
      body: Stack(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: _screens,
          ),

          FloatingNavBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() => _currentIndex = index);
            },
          ),
        ],
      ),
    );

  }
}
