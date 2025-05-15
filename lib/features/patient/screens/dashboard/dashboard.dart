import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/containers/primary_header_container.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/helpers/helper_functions.dart';
import 'package:medicare/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class PatientDashboardScreen extends StatelessWidget {
  const PatientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              TAppBar(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hey, ${THelperFunctions.capitalize(controller.user.value.name)}!',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .apply(color: TColors.neutralsWhite),
                    )
                  ],
                ),
                showBackArrow: false,
                actions: [
                  Stack(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Your action here
                        },
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.notifications_none,
                              size: 24,
                              color: TColors.neutralsDark,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7,
                        right: 8,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: TColors.coolOrange,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.08),
                    offset: Offset(0, 3),
                    blurRadius: 11,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.asset(
                            TImages.doctor1,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: TColors.orangeRange,
                                  borderRadius:
                                      BorderRadius.circular(TSizes.sm),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: TSizes.sm, vertical: TSizes.xs),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.favorite,
                                        color: Color(0xFFD42900),
                                        size: TSizes.md),
                                    SizedBox(width: 4),
                                    Text(
                                      '4.9',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .apply(color: Color(0xFFD42900)),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Dr. Abram George',
                                style: Theme.of(context).textTheme.titleSmall!,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'General Physician',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(fontWeightDelta: 600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Time Row
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: TColors.coolBlueNeutral,
                        borderRadius: BorderRadius.circular(TSizes.xs),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            spacing: TSizes.sm,
                            children: [
                              Icon(Icons.schedule,
                                  size: 18, color: TColors.coolOrange),
                              Text('Monday',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                          fontWeightDelta: 600,
                                          color: TColors.neutralsDark)),
                              Text(
                                'Oct 27, 2022',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(fontWeightDelta: 400),
                              ),
                            ],
                          ),
                          Text(
                            '9:00 - 9:30 am',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .apply(fontWeightDelta: 400),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Price and Button Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$100 / session',
                          style: Theme.of(context).textTheme.titleSmall!,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: TElevatedButtonTheme
                              .patientElevatedButtonTheme.style,
                          child: const Text('Book Appointment'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
