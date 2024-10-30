import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppThemes {
  static String? fontFamily = GoogleFonts.chakraPetch().fontFamily;
  static ThemeData theme() => ThemeData(
        scaffoldBackgroundColor: cSecondary,
        secondaryHeaderColor: Color(0xff43484C),
        fontFamily: fontFamily,
        colorScheme: AppThemes.customColorScheme,
      );

  static ColorScheme customColorScheme = const ColorScheme.dark().copyWith(
    primary: cPrimary,
    secondary: cSecondary,
    onPrimary: cOnPrimary,
    onPrimaryContainer: Color(0xff2E3236),
    onSecondaryContainer: Color(0xff949699),
  );
}
