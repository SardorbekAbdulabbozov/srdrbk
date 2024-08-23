import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:srdrbk/core/base_functions/base_functions.dart';
import 'package:srdrbk/core/keys/keys.dart';

class Storage {
  late Box _box;

  static Storage? _instance;

  static Storage get instance => _instance!;

  static Future<Storage> init() async {
    _instance = Storage();
    _instance!._box = await Hive.openBox('srdrbk');
    return _instance!;
  }

  Future<void> clearStorage() async {
    await _box.clear();
  }

  String getLocale() {
    return _box.get(Keys.locale, defaultValue: "en") ?? "en";
  }

  Future<void> setLocale(String locale) async {
    await _box.put(Keys.locale, locale);
  }

  ThemeMode getTheme() {
    final index = _box.get(Keys.theme, defaultValue: ThemeMode.dark.index) ??
        ThemeMode.dark.index;
    return BaseFunctions.mapIndexToThemeMode(index);
  }

  Future<void> setTheme(ThemeMode mode) async {
    await _box.put(Keys.theme, BaseFunctions.mapThemeModeToIndex(mode));
  }
}
