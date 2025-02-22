import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/authentication/controller/signup/signup_controller.dart';
import 'package:medicare/features/authentication/screen/login/login.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/validators/validation.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
        key: controller.signupFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
          child: Column(
            children: [
              //Name
              TextFormField(
                controller: controller.name,
                validator: (value) =>
                    TValidator.validateEmptyText('Name', value),
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              //Email
              TextFormField(
                controller: controller.email,
                validator: (value) => TValidator.validateEmail(value),
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //Password
              Obx(
                () => TextFormField(
                  controller: controller.password,
                  validator: (value) => TValidator.validatePassword(value),
                  obscureText: controller.hidePassword.value,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Icons.visibility
                              : Icons.visibility_off))),
                ),
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              //Sign in Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.signup(),
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
