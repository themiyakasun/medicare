import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TCheckboxTheme {
  TCheckboxTheme._();

  static CheckboxThemeData orangeCheckBoxTheme =
      CheckboxThemeData(checkColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return TColors.neutralsWhite;
    } else {
      return Colors.transparent;
    }
  }), fillColor: WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return TColors.coolOrange;
    } else if (states.contains(WidgetState.disabled)) {
      return TColors.neutralsGray2;
    } else {
      return Colors.transparent;
    }
  }));

  static CheckboxThemeData darkPurpleChecBoxTheme =
      CheckboxThemeData(checkColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return TColors.neutralsWhite;
    } else {
      return Colors.transparent;
    }
  }), fillColor: WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return TColors.darkPurple;
    } else if (states.contains(WidgetState.disabled)) {
      return TColors.neutralsGray2;
    } else {
      return Colors.transparent;
    }
  }));
}
