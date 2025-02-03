import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/constants/sizes.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final patientElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: TColors.neutralsWhite,
          backgroundColor: TColors.coolOrange,
          disabledBackgroundColor: TColors.coolOrange,
          disabledForegroundColor: TColors.neutralsGray6,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          textStyle: const TextStyle(
              fontFamily: 'Manrope', fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(TSizes.primaryButtonRadius))));

  static final doctorElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: TColors.neutralsWhite,
          backgroundColor: TColors.neutralsDark,
          disabledBackgroundColor: TColors.neutralsDark,
          disabledForegroundColor: TColors.neutralsGray6,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          textStyle: const TextStyle(
              fontFamily: 'Manrope', fontSize: 14, fontWeight: FontWeight.w500),
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(TSizes.primaryButtonRadius))));
}
