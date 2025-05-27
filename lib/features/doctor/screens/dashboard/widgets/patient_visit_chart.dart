import 'package:flutter/material.dart';

class PatientsVisitsChartSection extends StatelessWidget {
  const PatientsVisitsChartSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Patients Visits',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  '24 OCT - 30 OCT',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            // Chart navigation buttons
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, size: 20),
                  onPressed: () { /* Handle previous */ },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, size: 20),
                  onPressed: () { /* Handle next */ },
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        // Your actual Chart Widget would go here
        Container(
          height: 220, // Example height for the chart area
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.grey[100], // Lighter background for chart area
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!)
          ),
          child: const Center(child: Text("Your Chart Widget Here", style: TextStyle(color: Colors.grey))),
        ),
      ],
    );
  }
}