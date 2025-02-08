import 'package:flutter/material.dart';
import 'package:medicare/common/styles/spacing_styles.dart';
import 'package:medicare/common/widgets/divider.dart';
import 'package:medicare/common/widgets/social_buttons.dart';
import 'package:medicare/features/authentication/screen/signup/widgets/signup_form.dart';
import 'package:medicare/features/authentication/screen/signup/widgets/signup_header.dart';
import 'package:medicare/utils/constants/sizes.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            const TSignupHeader(),

            //Form
            const TSignupForm(),

            //Divider
            const TDivider(dividerText: 'Or Sign Up with'),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            //Footer
            const TSocialButtons()
          ],
        ),
      )),
    );
  }
}
