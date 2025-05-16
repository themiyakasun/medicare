import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TRatingCard extends StatelessWidget {
  const TRatingCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          Icon(Icons.favorite, color: Color(0xFFD42900), size: TSizes.md),
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
    );
  }
}
