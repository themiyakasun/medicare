import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/device/device_utility.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: TSizes.gridViewSpacing),
      child: Container(
        width: TDeviceUtils.getScreenWidth(context),
        padding: EdgeInsets.all(TSizes.gridViewSpacing),
        decoration: BoxDecoration(
            color: TColors.neutralsWhite,
            borderRadius: BorderRadius.circular(TSizes.xs),
            border: Border.all(color: TColors.neutralsGray1)),
        child: Row(
          children: [
            const Icon(
              Icons.search,
              color: TColors.neutralsGray1,
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              'Search your doctor',
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}
