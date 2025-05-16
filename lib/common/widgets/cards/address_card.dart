import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TAddressCard extends StatelessWidget {
  const TAddressCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: TColors.lightRoyalBlue,
          borderRadius: BorderRadius.circular(TSizes.xs)),
      padding: const EdgeInsets.symmetric(
          vertical: TSizes.sm, horizontal: TSizes.xs),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on, color: TColors.royalBlue, size: TSizes.md),
          Text(
            'New York, NY, US',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.royalBlue),
          )
        ],
      ),
    );
  }
}
