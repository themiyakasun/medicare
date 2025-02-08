import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              border: Border.all(color: TColors.neutralsGray5),
              borderRadius: BorderRadius.circular(8)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: TSizes.lg,
                  height: TSizes.lg,
                  image: AssetImage(TImages.google))),
        ),
        const SizedBox(
          width: TSizes.sm,
        ),
        Container(
          padding: EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              border: Border.all(color: TColors.neutralsGray5),
              borderRadius: BorderRadius.circular(TSizes.sm)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: TSizes.lg,
                  height: TSizes.lg,
                  image: AssetImage(TImages.facebook))),
        ),
      ],
    );
  }
}
