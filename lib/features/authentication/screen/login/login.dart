import 'package:flutter/material.dart';
import 'package:medicare/common/styles/spacing_styles.dart';
import 'package:medicare/common/widgets/divider.dart';
import 'package:medicare/common/widgets/social_buttons.dart';
import 'package:medicare/features/authentication/screen/login/widgets/login_form.dart';
import 'package:medicare/features/authentication/screen/login/widgets/login_header.dart';
import 'package:medicare/utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Login title
                      const TLoginHeader(),

                      // Form
                      const TLoginForm(),

                      // Divider
                      const TDivider(dividerText: 'Or Sign in with'),
                      const SizedBox(height: TSizes.spaceBtwSections),

                      // Footer
                      const TSocialButtons(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
