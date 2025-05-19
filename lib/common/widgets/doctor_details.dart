import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/common/widgets/cards/rating_card.dart';
import 'package:medicare/features/authentication/screen/book_appointment_details/book_appointment_details.dart';
import 'package:medicare/features/personalization/controllers/user_controller.dart';
import 'package:medicare/features/personalization/models/user_model.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class TDoctorsDetails extends StatelessWidget {
  final String userId;
  final String speciality;
  final bool showBooking;
  final String doctorId;

  const TDoctorsDetails(
      {super.key,
      required this.userId,
      required this.speciality,
      required this.showBooking,
      required this.doctorId});

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return FutureBuilder<UserModel>(
      future: userController.fetchUserById(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return const Text("Failed to load doctor's details");
        }

        if (snapshot.hasData && snapshot.data != null) {
          final user = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: user.profilePicture != ""
                        ? Image.network(
                            user.profilePicture,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
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
                        TRatingCard(
                          doctorId: doctorId,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Dr. ${user.name}',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          speciality,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .apply(fontWeightDelta: 600),
                        ),
                      ],
                    ),
                  ),
                  showBooking
                      ? TextButton(
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text(
                                'Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(color: TColors.coolOrange),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: TSizes.md,
                                color: TColors.coolOrange,
                              )
                            ],
                          ))
                      : const SizedBox.shrink()
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
              showBooking
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$100 / session',
                          style: Theme.of(context).textTheme.titleSmall!,
                        ),
                        ElevatedButton(
                          onPressed: () =>
                              Get.to(() => BookAppointmentDetailsScreen()),
                          style: TElevatedButtonTheme
                              .patientElevatedButtonTheme.style,
                          child: const Text('Book Appointment'),
                        ),
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          );
        }
        return const Text("Doctor not found");
      },
    );
  }
}
