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
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(TImages.logo),
                  height: 150,
                )
              ],
            ),

            Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                        width: 278,
                        child: Text(
                          'Please put your information below to sign in to your account',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ))
                  ],
                )),

            //Form
            Form(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
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
                        labelText: 'Password',
                        suffixIcon: Icon(Icons.visibility)),
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
                            child: Checkbox(
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          const Text('Remember me')
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
                    child: ElevatedButton(
                        onPressed: () {}, child: Text('Sign In')),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",
                          style: Theme.of(context).textTheme.bodyLarge),
                      TextButton(
                          onPressed: () {},
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
            )),

            //Divider
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Divider(
                  color: TColors.neutralsGray1,
                  thickness: 0.5,
                  indent: 0,
                  endIndent: 5,
                )),
                Text('Or Sign in with',
                    style: Theme.of(context).textTheme.bodyLarge),
                Flexible(
                    child: Divider(
                  color: TColors.neutralsGray1,
                  thickness: 0.5,
                  indent: 5,
                  endIndent: 0,
                )),
              ],
            ),

            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            //Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(TSizes.md),
                  decoration: BoxDecoration(
                      border: Border.all(color: TColors.neutralsGray5),
                      borderRadius: BorderRadius.circular(8)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: TSizes.lg,
                          height: TSizes.lg,
                          image: AssetImage(TImages.google))),
                ),
                const SizedBox(
                  width: TSizes.sm,
                ),
                Container(
                  padding: EdgeInsets.all(TSizes.md),
                  decoration: BoxDecoration(
                      border: Border.all(color: TColors.neutralsGray5),
                      borderRadius: BorderRadius.circular(TSizes.sm)),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                          width: TSizes.lg,
                          height: TSizes.lg,
                          image: AssetImage(TImages.facebook))),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
