import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/doctor/screens/dashboard/widgets/appointment_card.dart';
import 'package:medicare/features/doctor/screens/dashboard/widgets/blog_prompt.dart';
import 'package:medicare/features/doctor/screens/dashboard/widgets/patient_visit_chart.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/features/doctor/screens/dashboard/widgets/dashboard_header.dart';
import 'package:medicare/features/doctor/screens/search/search.dart';
import 'package:medicare/features/doctor/screens/menu/menu.dart';

class DoctorDashboardScreen extends StatelessWidget {
  const DoctorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    const double borderRadius = 32.0;
    const double fixedHeaderAreaHeight = 400.0;

    return Scaffold(
      body: Column(
        children: [
          // FIXED: Top Orange Section with Header and Appointment Card
          Container(
            height: fixedHeaderAreaHeight,
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: Stack(
              children: [
                // DashboardHeader
                DashboardHeader(
                  userName: controller.user.value.name ?? 'Doctor',
                ),
                // Upcoming Appointment Card
                const Positioned(
                  top: 130,
                  left: 16,
                  right: 16,
                  child: AppointmentCard(),
                ),
              ],
            ),
          ),

          // SCROLLABLE: White section with curved top corners
          Expanded(
            child: Transform.translate(
              offset: const Offset(0.0, -borderRadius),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(borderRadius),
                    topRight: Radius.circular(borderRadius),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(
                    top: borderRadius + 16,
                    left: 16,
                    right: 16,
                    bottom: 100,
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Patients Visits Chart Section
                      PatientsVisitsChartSection(),
                      SizedBox(height: 30),
                      // MedCare Blog Prompt (title + BlogCard)
                      MedCareBlogPrompt(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 16,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFF6B46C1), // Purple color like in your design
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavigationItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
                isSelected: true, // Current page is selected
                onTap: () {
                  // Already on dashboard
                },
              ),
              _buildNavigationItem(
                icon: Icons.calendar_today,
                label: 'Appointments',
                isSelected: false,
                onTap: () {
                  Get.to(() => AppointmentCard());
                },
              ),
              _buildNavigationItem(
                icon: Icons.search,
                label: 'Search',
                isSelected: false,
                onTap: () {
                  Get.to(() => doctorSearchScreen());
                },
              ),
              _buildNavigationItem(
                icon: Icons.menu,
                label: 'Menu',
                isSelected: false,
                onTap: () {
                  Get.to(() => doctorMenuScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 24,
              color: Colors.white,
            ),
            if (isSelected) const SizedBox(width: 8),
            if (isSelected)
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
