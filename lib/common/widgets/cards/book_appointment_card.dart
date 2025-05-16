import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:medicare/common/widgets/cards/rating_card.dart';
import 'package:medicare/features/authentication/screen/book_appointment_details/book_appointment_details.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class TBookAppointmentCard extends StatelessWidget {
  const TBookAppointmentCard({super.key, this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
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
                      TRatingCard(),
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
                TextButton(
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
                      Icon(Icons.schedule, size: 18, color: TColors.coolOrange),
                      Text('Monday',
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
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
                  onPressed: () => Get.to(() => BookAppointmentDetailsScreen()),
                  style: TElevatedButtonTheme.patientElevatedButtonTheme.style,
                  child: const Text('Book Appointment'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
