import 'package:flutter/material.dart';

class CallFeedback extends StatefulWidget {
  const CallFeedback({super.key});

  @override
  State<CallFeedback> createState() => _CallFeedbackState();
}

class _CallFeedbackState extends State<CallFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Center(
              child: Column(
                children: const [
                  Text(
                    "Your session with Dr. John Doe",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "is complete! 🎉",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Appointment Info Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dr. John Doe",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text("General Physician • Online visit"),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("08:00 am - 08:30 am"),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            "Completed",
                            style: TextStyle(color: Colors.green[800]),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // ✅ Corrected from 'primary'
                      ),
                      child: const Text("View Details"), // ✅ Moved 'child' to end
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            //feedback section here
          ],
        ),
      ),
    );
  }
}
