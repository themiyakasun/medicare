import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TAppointmentTypeButton extends StatelessWidget {
  const TAppointmentTypeButton(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onTap});

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
          padding:
              EdgeInsets.symmetric(vertical: TSizes.xs, horizontal: TSizes.md),
          decoration: BoxDecoration(
              color: isSelected ? TColors.orange30 : Colors.transparent,
              borderRadius: BorderRadius.circular(TSizes.sm)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodyLarge!.apply(
                    fontWeightDelta: 500,
                    color: isSelected
                        ? TColors.coolOrange
                        : TColors.neutralsGray2),
              ),
            ],
          )),
    ));
  }
}
