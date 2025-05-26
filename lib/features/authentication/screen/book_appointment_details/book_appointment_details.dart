import 'package:flutter/material.dart';
import 'package:medicare/common/widgets/appbar.dart';
import 'package:medicare/common/widgets/cards/address_card.dart';
import 'package:medicare/common/widgets/cards/rating_card.dart';
import 'package:medicare/common/widgets/containers/primary_header_container.dart';
import 'package:medicare/common/widgets/expandable_text.dart';
import 'package:medicare/features/authentication/screen/book_appointment_details/widgets/book_appointment_form.dart';
import 'package:medicare/features/authentication/screen/book_appointment_details/widgets/date_pick_slider.dart';
import 'package:medicare/features/authentication/screen/book_appointment_details/widgets/time_pick_slider.dart';
import 'package:medicare/features/personalization/models/doctor_model.dart';
import 'package:medicare/features/personalization/models/user_model.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class BookAppointmentDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;
  final UserModel user;

  const BookAppointmentDetailsScreen(
      {super.key, required this.doctor, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              TPrimaryHeaderContainer(
                  height: 350,
                  child: Column(
                    children: [
                      TAppBar(
                        title: Text(
                          'Back',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .apply(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.lg,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: TSizes.gridViewSpacing),
                        child: Row(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(TSizes.sm),
                              child: user.profilePicture != ""
                                  ? Image.network(
                                      user.profilePicture,
                                      width: 120,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.asset(
                                      TImages.doctor2,
                                      width: 120,
                                      height: 140,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 6),
                                Text(
                                  'Dr. ${user.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                        color: TColors.neutralsWhite,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  doctor.speciality,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(fontWeightDelta: 600),
                                ),
                                const SizedBox(
                                  height: TSizes.lg,
                                ),
                                TAddressCard(),
                                const SizedBox(
                                  height: TSizes.sm,
                                ),
                                TRatingCard(
                                  doctorId: doctor.id,
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: TSizes.lg,
                      )
                    ],
                  )),
              Positioned(
                top: 290,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.gridViewSpacing),
                  child: Container(
                    decoration: BoxDecoration(
                        color: TColors.lightPurple,
                        borderRadius: BorderRadius.circular(TSizes.sm)),
                    padding: EdgeInsets.symmetric(
                        vertical: 12, horizontal: TSizes.xl),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              '105',
                              style: TextStyle(
                                  color: TColors.neutralsDark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Reviews',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      fontWeightDelta: 600,
                                      color: TColors.neutralsDark),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '${doctor.experience}',
                              style: TextStyle(
                                  color: TColors.neutralsDark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Years exp',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      fontWeightDelta: 600,
                                      color: TColors.neutralsDark),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '1246',
                              style: TextStyle(
                                  color: TColors.neutralsDark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Patients',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .apply(
                                      fontWeightDelta: 600,
                                      color: TColors.neutralsDark),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: TSizes.xl,
          ),

          //Main-content
          Padding(
            padding: EdgeInsets.symmetric(horizontal: TSizes.gridViewSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 29,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Demography',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(fontWeightDelta: 700),
                    ),
                    const SizedBox(
                      height: TSizes.xs,
                    ),
                    TExpandableText(
                      doctor.bio,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose Date',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .apply(fontWeightDelta: 700),
                    ),
                    const SizedBox(
                      height: TSizes.xs,
                    ),
                    TDatePickSlider(
                      doctorId: doctor.id,
                    ),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Choose Time Slot',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .apply(fontWeightDelta: 700),
                  ),
                  const SizedBox(
                    height: TSizes.xs,
                  ),
                  TTimePickSlider(),
                ]),
                TBookAppointmentForm(doctor: doctor)
              ],
            ),
          )
        ],
      )),
    );
  }
}
