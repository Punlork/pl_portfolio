import 'package:flutter/material.dart';

class ThemeUtil {
  static bool isDarkMode(BuildContext context) => Theme.of(context).brightness == Brightness.dark;
}
