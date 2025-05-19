import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medicare/features/appointment/controller/rating_controller.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TRatingCard extends StatelessWidget {
  const TRatingCard({super.key, required this.doctorId});

  final String doctorId;

  @override
  Widget build(BuildContext context) {
    final ratingController = Get.find<RatingController>();

    return FutureBuilder<double>(
      future: ratingController.fetchAverageRating(doctorId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox();
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return const SizedBox();
        }

        final averageRating = snapshot.data!.toStringAsFixed(1);

        return Container(
          decoration: BoxDecoration(
            color: TColors.orangeRange,
            borderRadius: BorderRadius.circular(TSizes.sm),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: TSizes.sm, vertical: TSizes.xs),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.favorite,
                  color: Color(0xFFD42900), size: TSizes.md),
              const SizedBox(width: 4),
              Text(
                averageRating,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .apply(color: const Color(0xFFD42900)),
              ),
            ],
          ),
        );
      },
    );
  }
}
