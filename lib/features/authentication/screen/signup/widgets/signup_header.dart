import 'package:flutter/material.dart';
import 'package:medicare/utils/theme/custom_themes/image_strings.dart';

class TSignupHeader extends StatelessWidget {
  const TSignupHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(TImages.logo),
              height: 150,
            )
          ],
        ),
        Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create a new account',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                    width: 278,
                    child: Text(
                      'Please put your information below to create a new account',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ))
              ],
            )),
      ],
    );
  }
}
