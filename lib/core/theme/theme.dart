import 'package:flutter/material.dart';
import 'package:srdrbk/core/theme/colors/app_colors.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.grayLightDefault,
  colorScheme: ColorScheme.light(
    primary: AppColors.grayLightDefault,
    background: AppColors.grayLightDefault,
    brightness: Brightness.light,
  ),
  iconTheme: IconThemeData(color: AppColors.grayLight600),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      ),
      elevation: MaterialStateProperty.all(0),
      backgroundColor: MaterialStateProperty.all(AppColors.grayLightDefault),
      overlayColor: MaterialStateProperty.all(AppColors.grayDark900),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.grayLightDefault),
      padding: MaterialStateProperty.all(const EdgeInsets.all(6)),
      shape: MaterialStateProperty.all(
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
  colorScheme: ColorScheme.dark(
    primary: AppColors.grayDarkDefault,
    background: AppColors.grayDarkDefault,
    brightness: Brightness.dark,
  ),
  iconTheme: IconThemeData(color: AppColors.grayDark600),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      visualDensity: VisualDensity.compact,
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      ),
      backgroundColor: MaterialStateProperty.all(AppColors.grayDarkDefault),
      overlayColor: MaterialStateProperty.all(AppColors.grayLight700),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.grayDarkDefault),
      padding: MaterialStateProperty.all(const EdgeInsets.all(6)),
      shape: MaterialStateProperty.all(
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
