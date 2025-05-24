import 'package:flutter/material.dart';

class PatientAppointmentsScreen extends StatefulWidget {
  const PatientAppointmentsScreen({super.key});

  @override
  _PatientAppointmentsScreenState createState() => _PatientAppointmentsScreenState();
}

class _PatientAppointmentsScreenState extends State<PatientAppointmentsScreen> {
  int selectedTab = 0;
  DateTime selectedDate = DateTime.now();
  
  // Sample data
  final List<Appointment> appointments = [
    Appointment(
      id: '1',
      doctorName: 'Dr. Emma Mia',
      specialty: 'General Physician',
      visitType: 'Online visit',
      status: AppointmentStatus.upcoming,
      date: DateTime.now(),
      time: '9:00 - 9:30 am',
      avatar: 'assets/images/doctor1.jpg',
    ),
    Appointment(
      id: '2',
      doctorName: 'Dr. Randy Levin',
      specialty: 'General Physician',
      visitType: 'Online visit',
      status: AppointmentStatus.completed,
      date: DateTime.now().subtract(Duration(days: 1)),
      time: '10:00 - 10:30 am',
      avatar: 'assets/images/doctor2.jpg',
    ),
    Appointment(
      id: '3',
      doctorName: 'Dr. Zain Calzoni',
      specialty: 'General Physician',
      visitType: 'Online visit',
      status: AppointmentStatus.cancelled,
      date: DateTime.now().add(Duration(days: 1)),
      time: '2:00 - 2:30 pm',
      avatar: 'assets/images/doctor3.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text('Appointments', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildCalendarSection(),
          _buildTabSection(),
          Expanded(child: _buildAppointmentList()),
        ],
      ),
    );
  }

  Widget _buildCalendarSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'October 2022',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildDateItem(9, 'Mon', true),
              _buildDateItem(10, 'Tue', false),
              _buildDateItem(11, 'Wed', false),
              _buildDateItem(12, 'Thu', false),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDateItem(int day, String dayName, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDate = DateTime(2022, 10, day);
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF6C5CE7) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              day.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              dayName,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : Colors.grey[600],
              ),
            ),
            if (isSelected) ...[
              SizedBox(height: 8),
              Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTabSection() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '03 Appointments',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildTab('All', 0),
              _buildTab('Upcoming', 1),
              _buildTab('Completed', 2),
              _buildTab('Cancelled', 3),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    bool isSelected = selectedTab == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange[100] : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.orange[800] : Colors.grey[600],
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _buildAppointmentList() {
    List<Appointment> filteredAppointments = _getFilteredAppointments();
    
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: filteredAppointments.length,
      itemBuilder: (context, index) {
        return _buildAppointmentCard(filteredAppointments[index]);
      },
    );
  }

  List<Appointment> _getFilteredAppointments() {
    switch (selectedTab) {
      case 1: // Upcoming
        return appointments.where((a) => a.status == AppointmentStatus.upcoming).toList();
      case 2: // Completed
        return appointments.where((a) => a.status == AppointmentStatus.completed).toList();
      case 3: // Cancelled
        return appointments.where((a) => a.status == AppointmentStatus.cancelled).toList();
      default: // All
        return appointments;
    }
  }

  Widget _buildAppointmentCard(Appointment appointment) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(appointment.avatar),
                backgroundColor: Colors.grey[300],
                child: appointment.avatar.isEmpty 
                  ? Icon(Icons.person, color: Colors.grey[600])
                  : null,
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctorName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '${appointment.specialty} • ${appointment.visitType}',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              _buildStatusBadge(appointment.status),
            ],
          ),
          SizedBox(height: 16),
          if (appointment.time.isNotEmpty) ...[
            Row(
              children: [
                Icon(Icons.access_time, size: 16, color: Colors.grey[600]),
                SizedBox(width: 8),
                Text(
                  appointment.time,
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            SizedBox(height: 16),
          ],
          _buildActionButton(appointment),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(AppointmentStatus status) {
    Color color;
    String text;
    
    switch (status) {
      case AppointmentStatus.upcoming:
        color = Colors.orange;
        text = 'Upcoming';
        break;
      case AppointmentStatus.completed:
        color = Colors.green;
        text = 'Completed';
        break;
      case AppointmentStatus.cancelled:
        color = Colors.red;
        text = 'Cancelled';
        break;
    }
    
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildActionButton(Appointment appointment) {
    switch (appointment.status) {
      case AppointmentStatus.upcoming:
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // Handle attend now
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Attend Now',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        );
      case AppointmentStatus.completed:
        return SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              // Handle view details
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.orange),
            ),
            child: Text(
              'View Details',
              style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w600),
            ),
          ),
        );
      case AppointmentStatus.cancelled:
        return SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () {
              // Handle view details
            },
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              side: BorderSide(color: Colors.grey),
            ),
            child: Text(
              'View Details',
              style: TextStyle(color: Colors.grey[600], fontWeight: FontWeight.w600),
            ),
          ),
        );
    }
  }
}

// Data Models
class Appointment {
  final String id;
  final String doctorName;
  final String specialty;
  final String visitType;
  final AppointmentStatus status;
  final DateTime date;
  final String time;
  final String avatar;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.visitType,
    required this.status,
    required this.date,
    required this.time,
    required this.avatar,
  });
}

enum AppointmentStatus {
  upcoming,
  completed,
  cancelled,
}