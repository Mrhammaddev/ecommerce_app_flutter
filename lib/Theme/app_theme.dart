import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ecommerce_app_flutter/Utils/color_constants.dart' as config;

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: config.Colors().mainColorBlack,
    secondaryHeaderColor: config.Colors().mainColorBlack,
    scaffoldBackgroundColor: config.Colors().whit,
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
    appBarTheme: AppBarTheme(color: Colors.white),
    iconTheme: IconThemeData(color: config.Colors().mainColorBlack),
    focusColor: config.Colors().greyTooLight,
    cardColor: Color(0xffDCDCDC),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
          fontSize: 34.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      displayMedium: GoogleFonts.poppins(
          fontSize: 32.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      displaySmall: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: config.Colors().whit),
      headlineLarge: GoogleFonts.poppins(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      headlineMedium: GoogleFonts.poppins(
          fontSize: 26.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      headlineSmall: GoogleFonts.poppins(
          fontSize: 24.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      titleLarge: GoogleFonts.poppins(
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      titleMedium: GoogleFonts.poppins(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      titleSmall: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 16.0,
          // fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      bodySmall: GoogleFonts.poppins(
          fontSize: 14.0,
          // fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: config.Colors().mainColorBlack),
      labelLarge: GoogleFonts.poppins(
          fontSize: 18.0,
          // fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: config.Colors().greyLight),
      labelMedium: GoogleFonts.poppins(
          fontSize: 16.0,
          // fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: config.Colors().greyLight),
      labelSmall: GoogleFonts.poppins(
          fontSize: 13,
          letterSpacing: 0,
          // fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 106, 106, 106)),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    primaryColor: config.Colors().whit,
    secondaryHeaderColor: Color(0xFF2C2C2C),
    scaffoldBackgroundColor: config.Colors().scaffoldDarkColor,
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey[800]),
    appBarTheme: AppBarTheme(color: Colors.grey[800]),
    iconTheme: IconThemeData(color: Colors.white),
    focusColor: config.Colors().greyDark,
    cardColor: Color(0xFF2C2C2C),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.poppins(
          fontSize: 34.0,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          color: config.Colors().whit),
      displayMedium: GoogleFonts.poppins(
          fontSize: 32.0,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
          color: config.Colors().whit),
      displaySmall: GoogleFonts.poppins(
          fontSize: 18.0,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
          color: config.Colors().whit),
      headlineLarge: GoogleFonts.poppins(
          fontSize: 28.0,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          color: config.Colors().whit),
      headlineMedium: GoogleFonts.poppins(
          fontSize: 26.0,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
          color: config.Colors().whit),
      headlineSmall: GoogleFonts.poppins(
          fontSize: 24.0,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
          color: config.Colors().whit),
      titleLarge: GoogleFonts.poppins(
          fontSize: 22.0,
          letterSpacing: 0,
          fontWeight: FontWeight.bold,
          color: config.Colors().whit),
      titleMedium: GoogleFonts.poppins(
          fontSize: 18.0,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
          color: config.Colors().whit),
      titleSmall: GoogleFonts.poppins(
          fontSize: 16.0,
          letterSpacing: 0,
          fontWeight: FontWeight.w600,
          color: config.Colors().whit),
      bodyLarge: GoogleFonts.poppins(
          fontSize: 17,
          letterSpacing: 0,
          fontWeight: FontWeight.w500,
          color: config.Colors().whit),
      bodyMedium: GoogleFonts.poppins(
          fontSize: 16.0,
          letterSpacing: 0,
          // fontWeight: FontWeight.w500,
          color: config.Colors().whit),
      bodySmall: GoogleFonts.poppins(
          fontSize: 14.0,
          letterSpacing: 0,
          // fontWeight: FontWeight.w500,
          color: config.Colors().whit),
      labelLarge: GoogleFonts.poppins(
          fontSize: 18.0,
          letterSpacing: 0,
          // fontWeight: FontWeight.w500,
          color: config.Colors().greyLight),
      labelMedium: GoogleFonts.poppins(
          fontSize: 16.0,
          letterSpacing: 0,
          // fontWeight: FontWeight.w500,
          color: config.Colors().greyLight),
      labelSmall: GoogleFonts.poppins(
          fontSize: 13,
          letterSpacing: 0,
          // fontWeight: FontWeight.w500,
          color: Color.fromARGB(255, 106, 106, 106)),
    ),
  );
}
