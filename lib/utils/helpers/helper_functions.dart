import 'package:flutter/material.dart';

class THelperFunctions {
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static String capitalize(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1);
  }

  static List<DateTime> getDatesToEndOfWeek() {
    final today = DateTime.now();
    final daysToAdd = DateTime.saturday - today.weekday;
    return List.generate(daysToAdd + 1, (i) => today.add(Duration(days: i)));
  }

  static String getWeekdayName(int weekday) {
    const names = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    return names[weekday - 1];
  }

  static String calculateAmount(double amount) {
    final calculatedAmount = (amount * 100).round();
    return calculatedAmount.toString();
  }
}
