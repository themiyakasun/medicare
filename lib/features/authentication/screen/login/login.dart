import 'package:flutter/material.dart';
import 'package:medicare/common/styles/spacing_styles.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';
import 'package:medicare/utils/theme/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: TSpacingStyle.paddingWithAppBarHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              image: AssetImage(TImages.logo),
                              height: 150,
                            ),
                          ],
                        ),
                        SizedBox(height: TSizes.twoxl),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.titleMedium,
                            textAlign: TextAlign.left,
                          ),
                        ),

                        //form
                        Form(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: TSizes.spaceBtwItems),
                            child: Column(
                              children: [
                                //Email
                                TextFormField(
                                  decoration:
                                      const InputDecoration(labelText: 'Email'),
                                ),
                                const SizedBox(height: TSizes.spaceBtwItems),

                                //Password
                                TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Password',
                                      suffixIcon: Icon(Icons.visibility)),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
                                            value: true, onChanged: (value) {}),
                                        const Text('Remember me')
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text(
                                          'Forget password?',
                                          style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: TColors.coolOrange),
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: TSizes.md),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style:
                                      TAppTheme.doctorElevatedButtonTheme.style,
                                  onPressed: () {},
                                  child: const Text('Login'),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'New Here ?',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: TColors.darkPurple),
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Create Account',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: TColors.coolOrange),
                                      ))
                                ],
                              )
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
