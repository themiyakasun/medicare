import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TDivider extends StatelessWidget {
  const TDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
          color: TColors.neutralsGray1,
          thickness: 0.5,
          indent: 0,
          endIndent: 5,
        )),
        Text(dividerText, style: Theme.of(context).textTheme.bodyLarge),
        Flexible(
            child: Divider(
          color: TColors.neutralsGray1,
          thickness: 0.5,
          indent: 5,
          endIndent: 0,
        )),
      ],
    );
  }
}
