import 'package:flutter/material.dart';
import 'package:project_sathi/features/home/screen/home_screen.dart';
import 'package:project_sathi/features/home_nav/screen/home_nav_screen.dart';
class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: color.background,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Spacer(),

              Icon(Icons.task_alt, size: 90, color: color.primary),
               SizedBox(height: 20),

              Text(
                "Welcome to ProjectSathi",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
               SizedBox(height: 12),

              Text(
                "Organize your projects, track tasks, add notes, and see your progress easily—all stored locally.",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(color: color.onBackground.withOpacity(0.7)),
              ),
               SizedBox(height: 30),

              // Feature list

            Padding(
              padding:  EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Icon(Icons.check_circle, size: 24),
                  SizedBox(width: 12),
                  Expanded(child: Text("Create & manage projects")),
                ],
              ),
            ),
              Padding(
              padding:  EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Icon(Icons.list_alt, size: 24),
                  SizedBox(width: 12),
                  Expanded(child: Text("Track main & sub tasks")),
                ],
              ),
            ),
              Padding(
              padding:  EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Icon(Icons.note_alt, size: 24),
                  SizedBox(width: 12),
                  Expanded(child: Text("Add notes to tasks")),
                ],
              ),
            ),
              Padding(
              padding:  EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Icon(Icons.percent, size: 24),
                  SizedBox(width: 12),
                  Expanded(child: Text("Automatic progress calculation")),
                ],
              ),
            ),
              Padding(
              padding:  EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Icon(Icons.save, size: 24),
                  SizedBox(width: 12),
                  Expanded(child: Text("Stored locally, no internet required")),
                ],
              ),
            ),

               Spacer(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) =>  HomeNavScreen()),
                      );
                    },
                    child:  Text("Get Started"),
                  ),
                ),
              ),

               SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
