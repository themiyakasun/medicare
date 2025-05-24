import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/patient/screens/dashboard/dashboard.dart';
import 'package:medicare/features/personalization/screens/video_call/thanks_feedback.dart';

class CallFeedbackScreen extends StatefulWidget {
  const CallFeedbackScreen({super.key});

  @override
  State<CallFeedbackScreen> createState() => _CallFeedbackState();
}

class _CallFeedbackState extends State<CallFeedbackScreen> {
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
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "is complete! 🎉",
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Appointment Info Card
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.black.withOpacity(0.50),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Dr. John Doe",
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Text("General Physician • Online visit", style: TextStyle(fontSize: 13)),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("08:00 am - 08:30 am", style: TextStyle(fontSize: 13)),
                        const SizedBox(height: 8),
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
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.orange, 
                          side: const BorderSide(color: Colors.orange),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                          )
                        ),
                        child: const Text("View Details"), 
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            //feedback section here
            Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              shadowColor: Colors.black.withOpacity(0.50),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "We would love to hear from you",
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 8),

                    //Rating
                    Row(
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            // setState(() => selectedRating = index + 1);
                          },
                          child: Icon(Icons.favorite,
                            color: Colors.red, // Update conditionally based on selectedRating
                            size: 32,
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: 16),
                    TextFormField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        labelText: "Feedback",
                        floatingLabelBehavior: FloatingLabelBehavior.always,  
                        hintText: "Write your feedback here",
                        hintStyle: TextStyle(color: Colors.grey),
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.all(16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey), // Change color on focus
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey), // Default border color
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    //Buttons
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => ThanksFeedbackScreen()),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.orange,
                            ),
                        child: const Text("Submit"), 
                          )
                        )
                      ],
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () => Get.to(() => PatientDashboardScreen()), 
                        style:TextButton.styleFrom(
                          foregroundColor: Colors.orange,
                        ),
                        child: const Text("Skip & Go to Dashboard")
                      ),
                    )

                  ],
                ),
              ),
            )
            
          ],
        ),
      ),
    );
  }
}
