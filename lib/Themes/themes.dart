import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme = ThemeData(
  //APP RENKLERİ
  colorScheme: ColorScheme.light(
    primary: Colors.white,
    secondary: Colors.blueGrey,
    inversePrimary: Colors.white,
    surface: const Color.fromARGB(255, 190, 233, 255),
  ),

  textTheme: TextTheme(
    headlineLarge: GoogleFonts.michroma(
        decorationColor: Colors.blueGrey,
        fontSize: 55,
        fontWeight: FontWeight.w100,
        color: Colors.blueGrey),
    headlineMedium: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 24.sp, fontWeight: FontWeight.w300),
    headlineSmall: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 18.sp, fontWeight: FontWeight.w300),
    titleLarge: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 30.sp, fontWeight: FontWeight.w600),
    titleMedium: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 15.sp, fontWeight: FontWeight.w600),
    titleSmall: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 15.sp, fontWeight: FontWeight.w400),
    displayLarge: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 30.sp, fontWeight: FontWeight.w600),
    displayMedium: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 22.sp, fontWeight: FontWeight.w600),
    displaySmall: GoogleFonts.oswald(
        color: Colors.blueGrey, fontSize: 18.sp, fontWeight: FontWeight.w600),
        bodyLarge: GoogleFonts.oswald(
        color: Colors.black, fontSize: 18.sp, fontWeight: FontWeight.w300),
        bodyMedium: GoogleFonts.oswald(
        color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w300),
    bodySmall: GoogleFonts.oswald(
        color: Colors.black, fontSize: 15.sp, fontWeight: FontWeight.w400),
  ),
);
