import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/cards/book_appointment_card.dart';
import 'package:medicare/common/widgets/containers/search_container.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For formatting time

// If you still need these widgets for other parts of your app, keep their imports.
// Otherwise, they might become unused in this specific screen after the change.
// import 'package:medicare/common/widgets/appbar.dart';
// import 'package:medicare/common/widgets/cards/book_appointment_card.dart';
// import 'package:medicare/common/widgets/containers/search_container.dart';
// import 'package:medicare/utils/constants/colors.dart';
// import 'package:medicare/utils/constants/sizes.dart';


// Model for a time range
class TimeRange {
  TimeOfDay startTime;
  TimeOfDay endTime;

  TimeRange(this.startTime, this.endTime);
}

// Renamed from AvailabilityScreen to doctorSearchScreen
class doctorSearchScreen extends StatefulWidget {
  const doctorSearchScreen({Key? key}) : super(key: key);

  @override
  State<doctorSearchScreen> createState() => _doctorSearchScreenState();
}

// State class for doctorSearchScreen (formerly _AvailabilityScreenState)
class _doctorSearchScreenState extends State<doctorSearchScreen> {
  // Simulates the toggle state. True for "Always Available", false for "Specific hours"
  bool _isAlwaysAvailable = false;

  // Data structure to store specific hours for each day
  final Map<String, List<TimeRange>> _specificHours = {
    'Monday': [TimeRange(const TimeOfDay(hour: 8, minute: 0), const TimeOfDay(hour: 14, minute: 0))],
    'Tuesday': [],
    'Wednesday': [TimeRange(const TimeOfDay(hour: 11, minute: 0), const TimeOfDay(hour: 23, minute: 0))],
    'Thursday': [],
    'Friday': [TimeRange(const TimeOfDay(hour: 16, minute: 0), const TimeOfDay(hour: 20, minute: 0))],
    'Saturday': [],
    'Sunday': [],
  };

  // Function to show time picker and add a new time range
  Future<void> _addTimeRange(String day) async {
    final TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), // Ensures AM/PM format
          child: child!,
        );
      },
    );

    if (pickedStartTime == null) return;

    final TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), // Ensures AM/PM format
          child: child!,
        );
      },
    );

    if (pickedEndTime == null) return;

    setState(() {
      _specificHours[day]?.add(TimeRange(pickedStartTime, pickedEndTime));
    });
  }

  // Widget to build the specific hours section for a single day
  Widget _buildDayAvailabilityRow(String day) {
    bool hasSpecificHours = _specificHours[day]!.isNotEmpty;
    bool dayToggleActive = _specificHours[day]!.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(day, style: Theme.of(context).textTheme.bodyLarge),
              Switch(
                value: dayToggleActive,
                onChanged: (value) {
                  setState(() {
                    if (value) {
                      // If toggling on, prompt to add hours if none exist
                      if (_specificHours[day]!.isEmpty) {
                        _addTimeRange(day);
                      }
                    } else {
                      // If toggling off, clear all hours for that day
                      _specificHours[day]?.clear();
                    }
                  });
                },
              ),
            ],
          ),
          if (dayToggleActive && hasSpecificHours)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Column(
                children: _specificHours[day]!.map((range) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '${range.startTime.format(context)} to ${range.endTime.format(context)}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () {
                            // TODO: Implement editing of time range
                            print('Edit time range for $day');
                          },
                          child: const Icon(Icons.edit, size: 20, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          if (dayToggleActive && !hasSpecificHours)
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: OutlinedButton.icon(
                onPressed: () => _addTimeRange(day),
                icon: const Icon(Icons.add),
                label: const Text('Add more hours'),
              ),
            ),
        ],
      ),
    );
  }

  // Widget to display the "Always Available" confirmation
  Widget _buildAlwaysAvailableContent() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFFFFA500), // Cool Orange
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.calendar_month, // Or any relevant icon
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Setting yourself always available will let patients choose anytime for appointments.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isAlwaysAvailable = false; // Switch back to specific hours
              });
            },
            child: const Text('Go to Specific Hours'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Availability'), // AppBar title for the Availability screen
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 22),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top toggle row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isAlwaysAvailable = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: !_isAlwaysAvailable ? Colors.white : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: !_isAlwaysAvailable
                              ? [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Specific hours',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: !_isAlwaysAvailable ? Colors.black : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isAlwaysAvailable = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: _isAlwaysAvailable ? const Color(0xFFFFA500) : Colors.transparent, // Cool Orange
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: _isAlwaysAvailable
                              ? [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ]
                              : null,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Always Available',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _isAlwaysAvailable ? Colors.white : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Conditional rendering based on the toggle
            if (!_isAlwaysAvailable)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Information message for setting availability
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.blue[700]),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Set your availability to start attending patients',
                            style: TextStyle(color: Colors.blue[700]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Add hours of your availability',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10),
                  // List of days with their availability
                  ..._specificHours.keys.map((day) => _buildDayAvailabilityRow(day)).toList(),
                ],
              )
            else
              _buildAlwaysAvailableContent(),
          ],
        ),
      ),
      // Bottom Navigation Bar (retained from AvailabilityScreen)
      
    );
  }
}