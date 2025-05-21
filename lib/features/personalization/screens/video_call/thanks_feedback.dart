import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/patient/screens/dashboard/dashboard.dart';

class ThanksFeedbackScreen extends StatefulWidget {
  const ThanksFeedbackScreen({super.key});

  @override
  State<ThanksFeedbackScreen> createState() => _ThanksFeedbackState();
}

class _ThanksFeedbackState extends State<ThanksFeedbackScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🎉 Confetti simulation space
            const Padding(
              padding: EdgeInsets.only(top: 32),
              child: Text(
                '🎉',
                style: TextStyle(fontSize: 24),
              ),
            ),

            Column(
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
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  )
                ),
              ],
            ),

            //Go to Dashboard Button
            Padding(
              padding: EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => PatientDashboardScreen()), 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7A00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Go to Dashboard",
                    style: TextStyle(fontSize: 16),
                  )
                )
              ),
            ),
          ],
        )
      )
    );
  }
}