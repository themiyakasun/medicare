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

  // State to hold the password mismatch error message
  String? _passwordMismatchError; // This will hold the error message for password mismatch

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
              errorText: _passwordMismatchError, // Pass the error text to highlight the field
            ),
            // Conditionally display the error message below the field if it's not null
            if (_passwordMismatchError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0), // Padding above the error message
                child: Text(
                  _passwordMismatchError!,
                  style: const TextStyle(color: Colors.red, fontSize: 12.0), // Style for the error text
                ),
              ),
            const Spacer(), // Pushes the "Save Password" button to the bottom

            // Save Password Button
            SizedBox(
              width: double.infinity, // Make the button take the full available width
              child: ElevatedButton(
                onPressed: () {
                  // Clear previous error message when button is pressed
                  setState(() {
                    _passwordMismatchError = null;
                  });

                  // Get the current text from the controllers
                  final String oldPassword = _oldPasswordController.text;
                  final String newPassword = _newPasswordController.text;
                  final String retypeNewPassword = _retypeNewPasswordController.text;

                  // Basic validation: Check if any field is empty
                  if (oldPassword.isEmpty || newPassword.isEmpty || retypeNewPassword.isEmpty) {
                     ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('All password fields must be filled!'),
                        backgroundColor: Colors.orange, // Use a warning color
                      ),
                    );
                    return; // Stop further execution if fields are empty
                  }

                  // Validate if new password and retype new password match
                  if (newPassword != retypeNewPassword) {
                    setState(() {
                      _passwordMismatchError = 'New passwords do not match.';
                    });
                    // Show a SnackBar for quick user feedback
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('New passwords do not match!'),
                        backgroundColor: Colors.red, // Use a distinct color for errors
                      ),
                    );
                  } else {
                    // If passwords match, proceed with saving logic
                    print('Old Password: $oldPassword');
                    print('New Password: $newPassword');
                    print('Retype New Password: $retypeNewPassword');

                    // TODO: Add your actual password update API call here.
                    // This is where you would typically send the old and new passwords to your backend.
                    // Example:
                    // try {
                    //   await YourAuthService.changePassword(oldPassword, newPassword);
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(
                    //       content: Text('Password changed successfully!'),
                    //       backgroundColor: Colors.green,
                    //     ),
                    //   );
                    //   _oldPasswordController.clear();
                    //   _newPasswordController.clear();
                    //   _retypeNewPasswordController.clear();
                    //   // Optionally navigate back after success
                    //   // Navigator.pop(context);
                    // } catch (e) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       content: Text('Failed to change password: ${e.toString()}'),
                    //       backgroundColor: Colors.red,
                    //     ),
                    //   );
                    // }

                    // --- Placeholder for successful password change ---
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Password changed successfully!'),
                        backgroundColor: Colors.green, // Use a success color
                      ),
                    );
                    // Clear fields after successful change
                    _oldPasswordController.clear();
                    _newPasswordController.clear();
                    _retypeNewPasswordController.clear();
                    // Optionally navigate back after success
                    // Navigator.pop(context);
                  }
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
    String? errorText, // Added optional errorText parameter for displaying errors
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
              // Change border color to red if there's an error, otherwise grey
              borderSide: BorderSide(color: errorText != null ? Colors.red : Colors.grey, width: 0.8),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              // Change enabled border color to red if there's an error, otherwise grey
              borderSide: BorderSide(color: errorText != null ? Colors.red : Colors.grey, width: 0.8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              // Change focused border color to red if there's an error, otherwise orange
              borderSide: BorderSide(
                  color: errorText != null ? Colors.red : Colors.orange, width: 1.5),
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
            // Note: We are displaying the error text outside the InputDecoration
            // using a separate Text widget for better control over its position
            // and to avoid issues with InputDecoration's built-in error display
            // which might shift content.
          ),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black, // Input text style
              ),
        ),
      ],
    );
  }
}
