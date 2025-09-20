import 'package:flutter/material.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.grayLightDefault,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.grayLight600,
    selectionColor: AppColors.grayLight300,
    selectionHandleColor: AppColors.grayLight600,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.grayLightDefault,
    surface: AppColors.grayLightDefault,
    brightness: Brightness.light,
  ),
  iconTheme: IconThemeData(color: AppColors.grayLight600),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      ),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(AppColors.grayLightDefault),
      overlayColor: WidgetStatePropertyAll(AppColors.grayDark900),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.grayLightDefault),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(6)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    toolbarHeight: 68,
    scrolledUnderElevation: 0,
    titleSpacing: 0,
    backgroundColor: AppColors.grayLightDefault,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.grayLight200,
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Colors.transparent, width: 0),
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: AppColors.grayLightDefault,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.grayDarkDefault,
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: AppColors.grayDark600,
    selectionColor: AppColors.grayDark300,
    selectionHandleColor: AppColors.grayDark600,
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.grayDarkDefault,
    surface: AppColors.grayDarkDefault,
    brightness: Brightness.dark,
  ),
  iconTheme: IconThemeData(color: AppColors.grayDark600),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      ),
      backgroundColor: WidgetStatePropertyAll(AppColors.grayDarkDefault),
      overlayColor: WidgetStatePropertyAll(AppColors.grayLight700),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.grayDarkDefault),
      padding: const WidgetStatePropertyAll(EdgeInsets.all(6)),
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    toolbarHeight: 68,
    scrolledUnderElevation: 0,
    titleSpacing: 0,
    backgroundColor: AppColors.grayDarkDefault,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.grayDark200,
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side: const BorderSide(color: Colors.transparent, width: 0),
    ),
  ),
  drawerTheme: DrawerThemeData(
    backgroundColor: AppColors.grayDarkDefault,
  ),
);
