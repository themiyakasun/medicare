import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Change Password',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ChangePasswordScreen(),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  // Controllers for text fields
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController = TextEditingController();

  // States for password visibility
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isRetypeNewPasswordVisible = false;

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _retypeNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle back button press
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Change Password',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Old Password Field
            _buildPasswordField(
              controller: _oldPasswordController,
              labelText: 'Old Password',
              isVisible: _isOldPasswordVisible,
              onToggleVisibility: () {
                setState(() {
                  _isOldPasswordVisible = !_isOldPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 25), // Increased spacing
            // New Password Field
            _buildPasswordField(
              controller: _newPasswordController,
              labelText: 'New Password',
              isVisible: _isNewPasswordVisible,
              onToggleVisibility: () {
                setState(() {
                  _isNewPasswordVisible = !_isNewPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 25), // Increased spacing
            // Retype New Password Field
            _buildPasswordField(
              controller: _retypeNewPasswordController,
              labelText: 'Retype New Password',
              isVisible: _isRetypeNewPasswordVisible,
              onToggleVisibility: () {
                setState(() {
                  _isRetypeNewPasswordVisible = !_isRetypeNewPasswordVisible;
                });
              },
            ),
            const Spacer(), // Pushes the button to the bottom

            // Save Password Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle save password logic
                  print('Old Password: ${_oldPasswordController.text}');
                  print('New Password: ${_newPasswordController.text}');
                  print('Retype New Password: ${_retypeNewPasswordController.text}');
                  // You would typically add validation and API calls here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange, // Button color
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  elevation: 5, // Shadow
                ),
                child: const Text(
                  'Save Password',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a password text field
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: !isVisible,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey, width: 0.8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey, width: 0.8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.deepOrange, width: 1.5),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: onToggleVisibility,
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
            hintText: 'Enter $labelText',
            hintStyle: const TextStyle(color: Colors.black54),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 16),
        ),
      ],
    );
  }
}