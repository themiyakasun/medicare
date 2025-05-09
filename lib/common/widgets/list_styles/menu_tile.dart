import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TMenuTile extends StatelessWidget {
  const TMenuTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onPressed});

  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPressed,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: TColors.coolOrange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8)),
        child: Icon(
          icon,
          size: 24,
          color: TColors.coolOrange,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .apply(color: TColors.neutralsDark),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(
            Icons.arrow_forward,
            size: 24,
            color: TColors.neutralsGray2,
          )),
    );
  }
}
