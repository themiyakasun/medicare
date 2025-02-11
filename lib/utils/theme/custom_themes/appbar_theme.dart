import 'package:flutter/material.dart';
import 'package:medicare/utils/constants/colors.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static const appBarTheme = AppBarTheme(
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: TColors.neutralsDark, size: 24),
      actionsIconTheme: IconThemeData(color: TColors.neutralsDark, size: 24),
      titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: TColors.neutralsDark));
}
