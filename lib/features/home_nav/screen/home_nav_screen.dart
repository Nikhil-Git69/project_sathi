import 'package:flutter/material.dart';
import 'package:project_sathi/features/home/screen/home_screen.dart';
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
    "Manage Projects",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        backgroundColor: color.primary,
        foregroundColor: color.onPrimary,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),


      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: color.primary,
        unselectedItemColor: color.onSurface.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: "Manage",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
