import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TTimePickCard extends StatelessWidget {
  const TTimePickCard(
      {super.key,
      required this.time,
      required this.onTap,
      required this.isSelected});

  final String time;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? TColors.neutralsDark : TColors.neutralsGray6,
            borderRadius: BorderRadius.circular(TSizes.sm)),
        padding: EdgeInsets.symmetric(vertical: TSizes.lg, horizontal: 0),
        width: 110,
        height: 43,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                  fontWeightDelta: 500,
                  color: isSelected
                      ? TColors.neutralsWhite
                      : TColors.neutralsGray2),
            )
          ],
        ),
      ),
    );
  }
}
