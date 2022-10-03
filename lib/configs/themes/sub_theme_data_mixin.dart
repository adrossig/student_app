import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/configs/themes/app_colors.dart';

mixin SubThemeData {
  TextTheme getTextTheme() {
   return  GoogleFonts.quicksandTextTheme(const TextTheme(
      bodyText1: TextStyle(
        fontWeight: FontWeight.w400,
      ),
      bodyText2: TextStyle(
        fontWeight: FontWeight.w400,
      )
    ));
  }

  getIconTheme() {
    return const IconThemeData(
      color: onSurfaceTextColor,
      size: 16
    );
  }
}
