import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/appbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TAppBar(
              title: Text('Change Password'),
            )
          ],
        ),
      ),
    );
  }
}
