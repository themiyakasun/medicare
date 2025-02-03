import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/authentication/controller/on-boarding/onboarding_controller.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';
import 'package:medicare/utils/theme/theme.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Logo
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
              child: Row(
                children: [
                  Image(
                    image: AssetImage(TImages.logo),
                    width: 300,
                    height: 100,
                  ),
                ],
              ),
            ),
            // Text
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
              child: SizedBox(
                width: 350,
                child: Text(
                  'Treate more patients, generate more sales remotely',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            const SizedBox(height: TSizes.gridViewSpacing),
            // Button
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: TSizes.spaceBtwSections),
              child: Align(
                alignment: Alignment.topLeft,
                child: ElevatedButton.icon(
                  onPressed: () => controller.nextPage(),
                  icon: Icon(
                    Icons.add,
                    color: TColors.neutralsWhite,
                  ),
                  style: TAppTheme.doctorElevatedButtonTheme.style,
                  label: Text('Continue'),
                ),
              ),
            ),

            Expanded(
                child: Stack(
              children: [
                Positioned(
                    bottom: 200,
                    left: 70,
                    child: Image(image: AssetImage(TImages.eclipe3))),
                Positioned(
                    bottom: 0,
                    child: Image(image: AssetImage(TImages.eclipe2))),
                Positioned(
                    bottom: 120,
                    child: Image(image: AssetImage(TImages.eclipe1))),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image(
                    image: AssetImage(TImages.main),
                    width: 522,
                    height: 653,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
