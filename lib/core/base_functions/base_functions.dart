import 'package:flutter/material.dart';

class BaseFunctions {
  static int mapThemeModeToIndex(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return ThemeMode.light.index;
      case ThemeMode.dark:
        return ThemeMode.dark.index;
      case ThemeMode.system:
        return ThemeMode.system.index;
      default:
        return ThemeMode.dark.index;
    }
  }

  static mapIndexToThemeMode(int index) {
    switch (index) {
      case 0:
        return ThemeMode.system;
      case 1:
        return ThemeMode.light;
      case 2:
        return ThemeMode.dark;
      default:
        return ThemeMode.dark;
    }
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width < 1146;
  }

  static Future<void> scrollTo(BuildContext? context) async{
    if (context == null) return;
    await Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOut,
    );
  }
}
