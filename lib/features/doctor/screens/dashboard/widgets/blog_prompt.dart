import 'package:flutter/material.dart';
import 'package:medicare/features/doctor/screens/dashboard/widgets/blog_card.dart'; // Assuming this path

class MedCareBlogPrompt extends StatelessWidget {
  const MedCareBlogPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'How to setup a strong\nprofile on MedCure',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const BlogCard(), // Your existing BlogCard widget
      ],
    );
  }
}