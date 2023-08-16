import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: const Color.fromARGB(255, 40, 130, 43),
    scaffoldBackgroundColor: Colors.white,
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.white),
    appBarTheme: AppBarTheme(color: Colors.white),
    iconTheme: IconThemeData(color: Colors.black),
  );
  static final dark = ThemeData.dark().copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(),
    primaryColor: Color.fromARGB(255, 114, 249, 118),
    scaffoldBackgroundColor: Colors.black54,
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.grey[800]),
    appBarTheme: AppBarTheme(color: Colors.grey[800]),
    iconTheme: IconThemeData(color: Colors.white),
  );
}
