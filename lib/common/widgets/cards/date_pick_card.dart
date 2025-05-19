import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TDatePickCard extends StatelessWidget {
  final DateTime date;
  final bool isSelected;
  final VoidCallback onTap;

  const TDatePickCard({
    super.key,
    required this.date,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final day = DateFormat.E().format(date);
    final dayNum = date.day;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? TColors.neutralsDark : TColors.neutralsGray6,
          borderRadius: BorderRadius.circular(TSizes.sm),
        ),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: TSizes.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$dayNum',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color:
                    isSelected ? TColors.neutralsWhite : TColors.neutralsGray2,
              ),
            ),
            Text(
              day,
              style: Theme.of(context).textTheme.bodyLarge!.apply(
                    fontWeightDelta: 500,
                    color: isSelected
                        ? TColors.neutralsWhite
                        : TColors.neutralsGray2,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
