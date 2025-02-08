import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/authentication/screen/signup/signup.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/theme.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
      child: Column(
        children: [
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

          //Remember me & Forget Password
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Remember me
              Row(
                children: [
                  Theme(
                    data: ThemeData(
                      checkboxTheme: TAppTheme.darkPurpleCheckBoxTheme,
                    ),
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                    ),
                  ),
                  const Text('Remember me',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TColors.neutralsGray2))
                ],
              ),

              //Forget Password
              TextButton(
                  onPressed: () {},
                  child: const Text('Forget password?',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: TColors.neutralsGray2)))
            ],
          ),

          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),

          //Sign in Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {}, child: Text('Sign In')),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",
                  style: Theme.of(context).textTheme.bodyLarge),
              TextButton(
                  onPressed: () => Get.to(() => const SignupScreen()),
                  child: Text(
                    'Sign Up',
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
