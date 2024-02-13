import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final box = GetStorage();
  final _key = 'isThemeMode';

  ThemeMode get theme => _loadThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  bool _loadThemeFromBox() => box.read(_key) ?? false;
  _saveThemeToBox(bool isDarkMode) => box.write(_key, isDarkMode);

  void switchTheme() {
    Get.changeThemeMode(_loadThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    _saveThemeToBox(!_loadThemeFromBox());
    // log(_box.read("isThemeMode").toString());
  }
}
