import 'package:ecommerce_app_flutter/Views/Auth/login.dart';
import 'package:ecommerce_app_flutter/Views/landing.dart';
import 'package:ecommerce_app_flutter/Views/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Theme/app_theme.dart';
import 'Theme/theme_service.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: LandingScreen(),
    );
  }
}
