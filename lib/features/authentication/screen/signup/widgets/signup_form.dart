import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/authentication/screen/login/login.dart';
import 'package:medicare/features/authentication/screen/signup/verify_email.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: Column(
        children: [
          //Name
          TextFormField(
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          //Email
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          //Password
          TextFormField(
            decoration: const InputDecoration(
                labelText: 'Password', suffixIcon: Icon(Icons.visibility)),
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          //Sign in Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => Get.to(() => const VerifyEmailScreen()),
                child: Text('Create Account')),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?",
                  style: Theme.of(context).textTheme.bodyLarge),
              TextButton(
                  onPressed: () => Get.to(() => LoginScreen()),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: TColors.coolOrange),
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
