import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medicare/common/widgets/appbar.dart'; // Assuming TAppBar is defined here

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  // Define TextEditingControllers for each input field to manage their state
  final TextEditingController _nameController =
      TextEditingController(text: 'Rayna Carder'); //
  final TextEditingController _emailController =
      TextEditingController(text: 'adam.costa@email.com'); //
  final TextEditingController _contactController =
      TextEditingController(text: '(555) 555-1234'); //
  final TextEditingController _addressController =
      TextEditingController(text: '15205 North Kierland Blvd. Suite 100'); //

  File? _profileImage;
  final ImagePicker _picker = ImagePicker();

  // Function to handle picking an image from gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _profileImage = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Show options for picking image (gallery or camera)
  void _showImageSourceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Photo Library'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  }),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  // Dispose controllers to prevent memory leaks when the widget is removed
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _contactController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SingleChildScrollView allows the content to scroll if the screen size is small
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (left)
          children: [
            // Custom AppBar using TAppBar, which handles the title and back arrow
            TAppBar(
              title: Text(
                'Account Settings', //
                // Adjusted title font size and color to black
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black, // Set title color to black
                    ),
              ),
              showBackArrow: true, // Display the back arrow icon in the app bar
            ),
            // Padding around the main content for better visual separation from edges
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center, // Center contents specifically within this column for profile section and button
                children: [
                  // Profile Picture and "Change Profile Picture" Button Section
                  Row( // Use a Row to place avatar and button side-by-side
                    mainAxisAlignment: MainAxisAlignment.center, // Center the row horizontally
                    children: [
                      // Circular avatar for the profile picture
                      GestureDetector(
                        onTap: () => _showImageSourceOptions(context),
                        child: CircleAvatar(
                          radius: 50, // Size of the avatar
                          backgroundImage: _profileImage != null
                              ? FileImage(_profileImage!)
                              : const NetworkImage(
                                  'https://via.placeholder.com/150') as ImageProvider, // Placeholder image URL
                          backgroundColor: Colors.grey, // Fallback background color if image fails
                        ),
                      ),
                      const SizedBox(width: 20), // Spacing between avatar and button
                      // "Change Profile Picture" Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _showImageSourceOptions(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(255, 255, 255, 1), // Changed button color to white
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15), // Padding inside the button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Rounded corners for the button
                            ),
                            elevation: 3, // Adds a slight shadow
                            side: const BorderSide(color: Colors.grey, width: 0.8), // Add a border
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min, // To make the row (icon and text) shrink to content size
                            children: [
                              Icon(Icons.camera_alt,
                                  color: Colors.black, size: 20), // Camera icon
                              SizedBox(width: 8), // Spacing between icon and text
                              Text(
                                'Change Profile Picture', //
                                style: TextStyle(color: Colors.black, fontSize: 14), // Text style
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30), // Spacing after the profile section

                  // Form Fields (using a helper method for reusability and cleaner code)
                  _buildTextField(
                    context, // Pass context to access theme data for styling
                    'Name', //
                    _nameController,
                    hintText: 'Enter your name', // Specific hint text
                  ),
                  const SizedBox(height: 20), // Spacing between form fields
                  _buildTextField(
                    context,
                    'Email', //
                    _emailController,
                    readOnly: true, // Email field is read-only as per UI
                    hintText: 'Enter your email',
                  ),
                  const SizedBox(height: 20), //
                  _buildTextField(
                    context,
                    'Contact', //
                    _contactController,
                    keyboardType: TextInputType.phone, // Suggest numeric keyboard for phone input
                    hintText: 'Enter your contact number',
                  ),
                  const SizedBox(height: 20), //
                  _buildTextField(
                    context,
                    'Address', //
                    _addressController,
                    maxLines: 2, // Allow multiple lines for address input
                    hintText: 'Enter your address',
                  ),
                  const SizedBox(height: 40), // Spacing before the "Save Changes" button

                  // "Save Changes" Button
                  SizedBox(
                    width: double.infinity, // Button takes the full available width
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the "Save Changes" button press
                        print('Name: ${_nameController.text}');
                        print('Email: ${_emailController.text}');
                        print('Contact: ${_contactController.text}');
                        print('Address: ${_addressController.text}');
                        // TODO: Implement your data saving logic here (e.g., API calls, database updates)
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Changes Saved!')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Background color of the button
                        padding: const EdgeInsets.symmetric(vertical: 15), // Vertical padding
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10), // Rounded corners for the button
                        ),
                        elevation: 5, // Adds a shadow
                      ),
                      child: const Text(
                        'Save Changes', //
                        style: TextStyle(fontSize: 18, color: Colors.white), // Text style
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a common text field structure for consistency and reusability
  Widget _buildTextField(
    BuildContext context,
    String label,
    TextEditingController controller, {
    bool readOnly = false,
    TextInputType keyboardType = TextInputType.text, // Default keyboard type is text
    int? maxLines = 1, // Default to single line, can be overridden for multiline
    String? hintText, // Optional hint text for specific field guidance
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Align the label to the start (left)
      children: [
        Text(
          label, //
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey, // Label text color
                fontWeight: FontWeight.w500, // Medium font weight
              ),
        ),
        const SizedBox(height: 8), // Spacing between the label and the text field
        TextField(
          controller: controller, // Link controller to manage text input
          readOnly: readOnly, // Set to true for non-editable fields (like email)
          keyboardType: keyboardType, // Set appropriate keyboard for input type
          maxLines: maxLines, // Control the number of lines
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white, // Background color of the input area
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Rounded corners for the border
              borderSide: const BorderSide(color: Colors.grey, width: 0.8), // Default border style
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide:
                  const BorderSide(color: Colors.orange, width: 1.5), // Orange border when focused
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: Colors.grey, width: 0.8), // Enabled border style
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0), // Padding inside the text field
            hintText: hintText ?? 'Enter $label', // Display hint text
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
