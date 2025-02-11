import 'package:flutter/material.dart';
import 'package:medicare/common/styles/spacing_styles.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TAppBar(
                title: Image(
                  image: AssetImage(TImages.logo),
                  height: TSizes.twoxl,
                ),
              ),
              const SizedBox(
                height: 11,
              ),
              Text(
                'Password Recovery',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ),
              SizedBox(
                  width: 278,
                  child: Text(
                    'Please put your email to get recovery code to your email or phone number.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //form

              Form(
                  child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Email'),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Send Code')),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
