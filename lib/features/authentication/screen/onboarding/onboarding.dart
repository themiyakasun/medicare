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
        child: Stack(
          children: [
            // Background decorations (circles on left - adjusted positions)
            Positioned(
              bottom: 100,
              left: -50,
              child: Image.asset(
                'assets/images/on-board/image-2.png', // yellow circle
                width: 150,
              ),
            ),
            Positioned(
              bottom: 160,
              left: 10,
              child: Image.asset(
                'assets/images/on-board/image-3.png', // blue circle
                width: 220,
              ),
            ),
            Positioned(
              bottom: 240,
              left: 80,
              child: Image.asset(
                'assets/images/on-board/image-4.png', // light blue circle
                width: 180,
              ),
            ),

            // Main vertical content
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.spaceBtwSections,
                vertical: TSizes.spaceBtwSections,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo
                  Image.asset(
                    TImages.logo,
                    width: 150,
                  ),
                  const SizedBox(height: 20),

                  // Headline - adjusted line height and spacing
                  Text(
                    'Treat more\npatients, generate\nmore sales remotely',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: TColors.dartPurpleNeutral,
                          fontWeight: FontWeight.bold,
                          fontSize: 32.0,
                          height: 1.2, // Better line spacing
                        ),
                  ),
                  const SizedBox(height: 25),

                  // Button - slightly adjusted styling
                  SizedBox(
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () => controller.nextPage(),
                      icon: const Icon(Icons.add,
                          color: TColors.neutralsWhite, size: 20),
                      label: const Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      style:
                          TAppTheme.doctorElevatedButtonTheme.style?.copyWith(
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Doctor Image - positioned bottom right with better sizing
            Positioned(
              bottom: 0,
              right: 0,
              child: ClipRect(
                child: Image.asset(
                  'assets/images/on-board/image-1.png',
                  width: 350,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
