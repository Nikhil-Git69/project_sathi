import 'dart:async';
import 'package:flutter/material.dart';

class StudySessionScreen extends StatefulWidget {
  const StudySessionScreen({super.key});

  @override
  State<StudySessionScreen> createState() => _StudySessionScreenState();
}

class _StudySessionScreenState extends State<StudySessionScreen> {
  final List<int> timers = [30, 45, 60]; // minutes
  int? selectedTimer;
  int? customTimer;
  Duration remaining = Duration.zero;
  Timer? countdownTimer;
  FocusNode notesFocus = FocusNode();


  //snackbar msg as a short function
  void showSnackMessage(BuildContext context, String message) {

    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // avoid stacking
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(child: Text(message)),
        duration: Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(16),
      ),
    );
  }
  
  //start timer function
  void startTimer() {
    if (selectedTimer == null) return showSnackMessage(context, "Select a time to start");

    countdownTimer?.cancel();
    setState(() {
      remaining = Duration(minutes: selectedTimer!); // Initialize
    });

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remaining.inSeconds <= 0) {
        timer.cancel();
        showSnackMessage(context, "Session Complete!");
      } else {
        setState(() {
          remaining -= const Duration(seconds: 1);
        });
      }
    });
  }

  //reStart timer function
  void restart() {
    if (selectedTimer == null) {
      showSnackMessage(context, "No timer running to restart");
      return;
    }

    countdownTimer?.cancel();
    setState(() {
      remaining = Duration(minutes: selectedTimer!);
    });
  }


  //reset timer function
  void resetTimer() {
    if (selectedTimer  == null) {
      showSnackMessage(context, "No timer running to reset");
      return;
    }

    countdownTimer?.cancel();
    setState(() {
      remaining = Duration.zero;
      selectedTimer = null;
    });
  }
  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = d.inSeconds.remainder(60).toString().padLeft(2, '0');
    return "${d.inHours.toString().padLeft(2, '0')}:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;


    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
          currentFocus.focusedChild!.unfocus();
        }
      },
      child: Scaffold(

        appBar: AppBar(
          title: const Text("Study Session", style: TextStyle(color: Colors.white),),
          backgroundColor: color.primary,
          foregroundColor: color.onPrimary,
          iconTheme: const IconThemeData(color: Colors.white),

        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Timer Selector
                if (selectedTimer == null)
                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: timers.length + 1, // +1 for custom
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        if (index < timers.length) {
                          final min = timers[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTimer = min;
                                remaining = Duration(minutes: selectedTimer!);
            
                              });
            
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              decoration: BoxDecoration(
                                color: color.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: color.primary.withValues(alpha: 0.1),
                                    blurRadius: 12,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "$min min",
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: color.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          // Custom timer placeholder
                          return Row(
                           children: [
                             GestureDetector(
                              onTap: () {
                                // TODO: open dialog for custom minutes
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  color: color.primary.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: color.primary),
                                ),
                                child: const Center(child: Text("Custom")),
                              ),
                            ),
                             const SizedBox(width: 12),
                             GestureDetector(
                              onTap: () {
                                // TODO: open dialog for custom minutes
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                decoration: BoxDecoration(
                                  color: color.primary.withValues(alpha: 0.5),
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: color.primary),
                                ),
                                child: const Center(child: Text("Stop Watch")),
                              ),
                            ),
                            ],
                          );
                        }
                      },
                    ),
                  ),
                const SizedBox(height: 40),
            
                // Timer Display
                Text(
                  formatDuration(remaining),
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color.onSurface,
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 20),
            
                // Control buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: startTimer,
                      style:  ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: color.primary,
                        foregroundColor:  color.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text("Start"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: restart,
                      style:  ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: color.primary,
                        foregroundColor:  color.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text("Restart"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: resetTimer,
                      style:  ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: color.primary,
                        foregroundColor:  color.onPrimary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text("Reset"),
                    ),
                  ],
                ),
            
                const SizedBox(height: 20),


                Text("Notes:", style: TextStyle(color:  color.onSurface, fontSize: 16)),
                const SizedBox(height: 5 ),

                // Notes Section
                TextField(
                  focusNode: notesFocus,
                  maxLines: 10,
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  scrollPhysics: const BouncingScrollPhysics(),
                  decoration: InputDecoration(
                    hintText: "Notes...",
                    filled: true,
                    fillColor: color.onSurfaceVariant.withValues(alpha: 0.05),
                     border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
