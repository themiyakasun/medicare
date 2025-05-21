import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart'; 
import 'dart:math'; 

import 'package:medicare/features/patient/screens/dashboard/dashboard.dart'; 

class ThanksFeedbackScreen extends StatefulWidget {
  const ThanksFeedbackScreen({super.key});

  @override
  State<ThanksFeedbackScreen> createState() => _ThanksFeedbackState();
}

class _ThanksFeedbackState extends State<ThanksFeedbackScreen> {
  late ConfettiController _confettiController; // Declare the controller

  @override
  void initState() {
    super.initState();
    // Initialize the confetti controller
    _confettiController = ConfettiController(duration: const Duration(seconds: 3));
    // Play the confetti animation automatically when the screen loads
    _confettiController.play();
  }

  @override
  void dispose() {
    _confettiController.dispose(); // Dispose the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: SafeArea(
        child: Stack(
          children: [
            // Confetti animation layer
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confettiController,
                blastDirection: pi / 2, 
                maxBlastForce: 20, 
                minBlastForce: 10, 
                emissionFrequency: 0.05, 
                numberOfParticles: 50, 
                gravity: 0.3, 
                shouldLoop: false, 
                colors: const [ 
                  Colors.orange,
                  Colors.yellow,
                  Colors.red,
                  Colors.purple,
                  Colors.blue,
                ],
                blastDirectionality: BlastDirectionality.explosive, // More spread out
              ),
            ),

            // Main content layer
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                
                const SizedBox(height: 100),

                // Main feedback content
                Expanded( 
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, 
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFF3E6), 
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.check_circle_outline,
                            size: 64,
                            color: Colors.orange, 
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        "Thank you for the feedback!",
                        textAlign: TextAlign.center, 
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Go to Dashboard Button
                Padding(
                  padding: const EdgeInsets.all(16.0), 
                  child: SizedBox(
                    width: double.infinity, 
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => Get.offAll(() => PatientDashboardScreen()), 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF7A00), 
                        foregroundColor: Colors.white, 
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0, 
                      ),
                      child: const Text(
                        "Go to Dashboard",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}