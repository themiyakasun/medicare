import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme textTheme = TextTheme(
      //headings
      headlineLarge: const TextStyle().copyWith(
          fontSize: 48.0,
          fontWeight: FontWeight.bold,
          color: TColors.neutralsDark),
      headlineMedium: const TextStyle().copyWith(
          fontSize: 38.0,
          fontWeight: FontWeight.bold,
          color: TColors.neutralsDark),
      headlineSmall: const TextStyle().copyWith(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: TColors.neutralsDark),

      //titles
      titleLarge: const TextStyle().copyWith(
          fontSize: 40,
          fontWeight: FontWeight.w600,
          color: TColors.neutralsDark),
      titleMedium: const TextStyle().copyWith(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: TColors.neutralsDark),
      titleSmall: const TextStyle().copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: TColors.neutralsDark),

      //body
      bodyLarge: const TextStyle().copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: TColors.neutralsGray2),
      bodyMedium: const TextStyle().copyWith(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: TColors.neutralsGray2));
}
