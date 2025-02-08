import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';
import 'package:medicare/utils/theme/custom_themes/appBar_theme.dart';
import 'package:medicare/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:medicare/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:medicare/utils/theme/custom_themes/text_field_theme.dart';
import 'package:medicare/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Manrope',
    brightness: Brightness.light,
    primaryColor: TColors.neutralsDark,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.textTheme,
    elevatedButtonTheme: TElevatedButtonTheme.patientElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.inputDecorationTheme,
    appBarTheme: TAppBarTheme.appBarTheme,
    checkboxTheme: TCheckboxTheme.orangeCheckBoxTheme,
  );

  static ElevatedButtonThemeData get patientElevatedButtonTheme =>
      TElevatedButtonTheme.patientElevatedButtonTheme;
  static ElevatedButtonThemeData get doctorElevatedButtonTheme =>
      TElevatedButtonTheme.doctorElevatedButtonTheme;

  static CheckboxThemeData get orangeCheckBoxTheme =>
      TCheckboxTheme.orangeCheckBoxTheme;
  static CheckboxThemeData get darkPurpleCheckBoxTheme =>
      TCheckboxTheme.darkPurpleChecBoxTheme;
}
