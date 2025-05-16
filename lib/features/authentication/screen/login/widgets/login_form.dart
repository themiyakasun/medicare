import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/authentication/controller/login/login_controller.dart';
import 'package:medicare/features/authentication/screen/password_recovery/password_recovery.dart';
import 'package:medicare/features/authentication/screen/signup/signup.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/theme.dart';
import 'package:medicare/utils/validators/validation.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
          child: Column(
            children: [
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
                          child: Obx(() => Checkbox(
                                value: controller.rememberMe.value,
                                onChanged: (value) => controller.rememberMe
                                    .value = !controller.rememberMe.value,
                              )),
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
                      onPressed: () => Get.to(() => PasswordRecoveryScreen()),
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
                child: ElevatedButton(
                    onPressed: () => controller.emailAndPasswordSignIn(),
                    child: Text('Sign In')),
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
