import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/containers/primary_header_container.dart';
import 'package:medicare/features/authentication/screen/dashboard/widgets/top_doctors_slider.dart';
import 'package:medicare/features/patient/screens/search/search.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/helpers/helper_functions.dart';

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
              height: 250,
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
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Top Doctors',
                          style: Theme.of(context).textTheme.titleSmall!,
                        ),
                        TextButton(
                            onPressed: () =>
                                Get.to(() => const PatientSearchScreen()),
                            child: Text(
                              'See all',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(fontWeightDelta: 500),
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.md,
                  ),
                  TTopDoctorsSlider()
                ],
              ))
        ],
      ),
    ));
  }
}
