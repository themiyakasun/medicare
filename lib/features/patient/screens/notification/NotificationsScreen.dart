import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          NotificationTile(
            icon: Icons.campaign,
            iconColor: Colors.orange,
            iconBgColor: Color(0xFFFFF3E0),
            title: 'Appointment Reminder',
            subtitle: 'Your appointment with Dr. Sarah Wilson is tomorrow at 2:00 PM',
            time: '2 min ago',
          ),
          NotificationTile(
            icon: Icons.calendar_today,
            iconColor: Colors.purple,
            iconBgColor: Color(0xFFF3E5F5),
            title: 'Prescription Ready',
            subtitle: 'Your prescription is ready for pickup at MedPlus Pharmacy',
            time: '15 min ago',
          ),
          NotificationTile(
            icon: Icons.message,
            iconColor: Colors.green,
            iconBgColor: Color(0xFFE8F5E8),
            title: 'Message from Dr. Themiya',
            subtitle: 'Your test results are ready. Please check the app for details.',
            time: '1hr ago',
          ),
          NotificationTile(
            icon: Icons.favorite,
            iconColor: Colors.red,
            iconBgColor: Color(0xFFFFEBEE),
            title: 'Lab Results Available',
            subtitle: 'Your blood work results from yesterday are now available',
            time: '2hrs ago',
          ),
          NotificationTile(
            icon: Icons.account_balance_wallet,
            iconColor: Colors.green,
            iconBgColor: Color(0xFFE8F5E8),
            title: 'Health Tip',
            subtitle: 'Remember to take your medication with food to avoid stomach upset',
            time: '4hrs ago',
          ),
          NotificationTile(
            icon: Icons.menu_book,
            iconColor: Colors.orange,
            iconBgColor: Color(0xFFFFF3E0),
            title: 'Medication Reminder',
            subtitle: 'Time to take your evening medication - Metformin 500mg',
            time: '6hrs ago',
          ),
          NotificationTile(
            icon: Icons.bar_chart,
            iconColor: Colors.blue,
            iconBgColor: Color(0xFFE3F2FD),
            title: 'Appointment Confirmed',
            subtitle: 'Your appointment with Dr. Martinez has been confirmed for Friday',
            time: '1 day ago',
          ),
          NotificationTile(
            icon: Icons.access_time,
            iconColor: Colors.cyan,
            iconBgColor: Color(0xFFE0F2F1),
            title: 'Vaccination Due',
            subtitle: 'Your annual flu vaccination is due. Schedule an appointment.',
            time: '2 days ago',
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final String time;

  const NotificationTile({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}