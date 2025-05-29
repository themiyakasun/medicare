import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  final String userName;

  const SupportScreen({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 254, 255),
      appBar: AppBar(
        title: const Text("Support"),
        backgroundColor: const Color.fromARGB(255, 243, 146, 20),
        foregroundColor: const Color.fromARGB(255, 237, 149, 6),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey, Dr. $userName!',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
            ),
            const SizedBox(height: 20),
            const Text(
              "How can we assist you today?",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 30),
            SupportOption(
              icon: Icons.chat_bubble_outline,
              title: "Live Chat",
              description: "Chat with our support team",
              onTap: () {
                // Add navigation or action
              },
            ),
            SupportOption(
              icon: Icons.email_outlined,
              title: "Email Us",
              description: "Send us your questions",
              onTap: () {
                // Add email launch or contact form
              },
            ),
            SupportOption(
              icon: Icons.call_outlined,
              title: "Call Support",
              description: "Speak with a representative",
              onTap: () {
                // Add phone call logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SupportOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const SupportOption({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 243, 146, 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Colors.white),
        title: Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600)),
        subtitle: Text(description,
            style: const TextStyle(color: Color.fromARGB(202, 219, 211, 211))),
        trailing:
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
      ),
    );
  }
}
