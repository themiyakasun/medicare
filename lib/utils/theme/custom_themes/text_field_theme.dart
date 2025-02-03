import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.neutralsDark,
    suffixIconColor: TColors.neutralsDark,
    labelStyle:
        const TextStyle().copyWith(fontSize: 12, color: TColors.neutralsDark),
    hintStyle:
        const TextStyle().copyWith(fontSize: 12, color: TColors.coolOrange),
    errorStyle:
        const TextStyle().copyWith(fontSize: 12, color: TColors.warning),
    floatingLabelStyle: const TextStyle().copyWith(color: TColors.neutralsDark),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: TColors.neutralsDark)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: TColors.neutralsDark)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: TColors.neutralsDark)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: TColors.warning)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: TColors.warning)),
  );
}
