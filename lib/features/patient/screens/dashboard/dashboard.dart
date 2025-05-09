import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/containers/primary_header_container.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/utils/constants/colors.dart';
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
          ))
        ],
      ),
    ));
  }
}
