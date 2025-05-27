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
        // The primarySwatch defines a color palette for the app, including various shades.
        // It's good practice to define one, but you might override specific colors later.
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Define a custom text theme for consistent styling across the app.
        textTheme: const TextTheme(
          // Define a style for bodyLarge, which can be used for main text content.
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black),
          // Define a style for bodyMedium, often used for hints or secondary text.
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.black54),
          // Define a style for bodySmall, for labels or less prominent text.
          bodySmall: TextStyle(fontSize: 12.0, color: Colors.grey),
        ),
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
  // Controllers for text fields to manage their input
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _retypeNewPasswordController =
      TextEditingController();

  // States to control the visibility of password text (toggle between hidden and visible)
  bool _isOldPasswordVisible = false;
  bool _isNewPasswordVisible = false;
  bool _isRetypeNewPasswordVisible = false;

  @override
  void dispose() {
    // Dispose of the controllers to prevent memory leaks when the widget is removed from the widget tree
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _retypeNewPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar for the screen, providing a title and a back button
      appBar: AppBar(
        backgroundColor: Colors.white, // Set app bar background to white
        elevation: 0, // Remove shadow from the app bar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Back arrow icon
          onPressed: () {
            // Navigate back to the previous screen when the back button is pressed
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Change Password',
          // Apply text style from the theme, ensuring bold black text
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black,
              ),
        ),
        centerTitle: false, // Align title to the start (left)
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Apply consistent padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children horizontally
          children: [
            // Old Password Field
            _buildPasswordField(
              controller: _oldPasswordController,
              labelText: 'Old Password',
              isVisible: _isOldPasswordVisible,
              onToggleVisibility: () {
                // Toggle the visibility state for the old password field
                setState(() {
                  _isOldPasswordVisible = !_isOldPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 25), // Spacing between fields
            // New Password Field
            _buildPasswordField(
              controller: _newPasswordController,
              labelText: 'New Password',
              isVisible: _isNewPasswordVisible,
              onToggleVisibility: () {
                // Toggle the visibility state for the new password field
                setState(() {
                  _isNewPasswordVisible = !_isNewPasswordVisible;
                });
              },
            ),
            const SizedBox(height: 25), // Spacing between fields
            // Retype New Password Field
            _buildPasswordField(
              controller: _retypeNewPasswordController,
              labelText: 'Retype New Password',
              isVisible: _isRetypeNewPasswordVisible,
              onToggleVisibility: () {
                // Toggle the visibility state for the retype new password field
                setState(() {
                  _isRetypeNewPasswordVisible = !_isRetypeNewPasswordVisible;
                });
              },
            ),
            const Spacer(), // Pushes the "Save Password" button to the bottom

            // Save Password Button
            SizedBox(
              width: double.infinity, // Make the button take the full available width
              child: ElevatedButton(
                onPressed: () {
                  // Handle save password logic
                  print('Old Password: ${_oldPasswordController.text}');
                  print('New Password: ${_newPasswordController.text}');
                  print('Retype New Password: ${_retypeNewPasswordController.text}');
                  // TODO: Add your validation and API calls here to update the password
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password Change Attempted!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Background color of the button
                  padding: const EdgeInsets.symmetric(vertical: 15), // Vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  elevation: 5, // Add a shadow to the button
                ),
                child: const Text(
                  'Save Password',
                  style: TextStyle(fontSize: 18, color: Colors.white), // Text style for the button
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a consistent password text field with a visibility toggle
  Widget _buildPasswordField({
    required TextEditingController controller,
    required String labelText,
    required bool isVisible,
    required VoidCallback onToggleVisibility,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align label to the start (left)
      children: [
        Text(
          labelText, // Display the label (e.g., "Old Password")
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey, // Label text color
                fontWeight: FontWeight.w500, // Medium font weight
              ),
        ),
        const SizedBox(height: 8), // Spacing between the label and the text field
        TextFormField(
          controller: controller, // Link the controller to the text field
          obscureText: !isVisible, // Hide text if not visible
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, // Background color of the input area
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners for the border
              borderSide: const BorderSide(color: Colors.grey, width: 0.8), // Default border style
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey, width: 0.8), // Enabled border style
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                  color: Colors.orange, width: 1.5), // Orange border when focused
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility : Icons.visibility_off, // Eye icon to toggle visibility
                color: Colors.grey,
              ),
              onPressed: onToggleVisibility, // Callback to toggle visibility
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0), // Padding inside the text field
            hintText: 'Enter $labelText', // Hint text
            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.black54, // Hint text style
                ),
          ),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black, // Input text style
              ),
        ),
      ],
    );
  }
}
