import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TPaymentInfoCard extends StatelessWidget {
  const TPaymentInfoCard({super.key, required this.label, required this.price});

  final String label;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .apply(color: TColors.neutralsGray2),
        ),
        Text(
          price,
          style: Theme.of(context).textTheme.titleSmall,
        )
      ],
    );
  }
}
