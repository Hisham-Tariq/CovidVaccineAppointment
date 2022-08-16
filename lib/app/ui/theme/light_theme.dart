import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common_theme.dart';

class LightTheme {
  // static const secondaryColor = Color(0xFF48cca0);
  // static const secondaryColor = Color(0xFF1d4e5f);
  // static const secondaryColor = Color(0xFFffb057);
  // static const secondaryColor = Color(0xFFF9D67D);
  static const secondaryColor = Color(0xFFFF9171);
  // static const onSecondary = Colors.black;
  static const onSecondary = Colors.white;
  static const primaryColor = Color(0xff79addc);
  static const primaryColorLight = Color(0x1aacdfff);
  static const primaryColorDark = Color(0xff477eaa);
  // static const lightScaffold = Color(0xfffdf6ed);
  static const scaffold = Color(0xfff0efeb);
  // static const lightScaffold = Color(0xffffffff);

  static Color background = Colors.grey.shade200;
  static const onBackground = Colors.black;

  final theme = ThemeData.light().copyWith(
    primaryColorBrightness: Brightness.light,
    cardColor: Colors.white,
    shadowColor: Colors.grey,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorLight,
    primaryColorDark: primaryColorDark,
    canvasColor: const Color(0xffE09E45),
    scaffoldBackgroundColor: scaffold,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: secondaryColor,
      selectionHandleColor: secondaryColor,
      cursorColor: secondaryColor,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      bodyText2: Themes.defaultFontFamily.copyWith(
        color: Colors.black,
        fontSize: 13.0,
      ), // Default style of any Text Widget
      bodyText1: Themes.defaultFontFamily.copyWith(
        color: secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 13.0,
      ),
      headline4: Themes.defaultFontFamily.copyWith(
        color: Colors.black,
      ),
      subtitle1: Themes.defaultFontFamily.copyWith(
        color: Colors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: secondaryColor,
        primary: onSecondary,
        shape: const StadiumBorder(),
        minimumSize: const Size(200, 50),
        textStyle: GoogleFonts.roboto(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          // fontSize: 18.0,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: secondaryColor,
        shape: const StadiumBorder(),
        side: const BorderSide(color: secondaryColor, width: 1),
        minimumSize: const Size(200, 50),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(secondaryColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: onSecondary,
      extendedTextStyle: Themes.defaultFontFamily.copyWith(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelStyle: Themes.defaultFontFamily.copyWith(
        color: secondaryColor,
        fontWeight: FontWeight.w900,
        fontSize: 16.0,
        letterSpacing: 1.2,
      ),
      labelStyle: Themes.defaultFontFamily.copyWith(
        color: Colors.grey.shade500,
        fontWeight: FontWeight.w900,
        fontSize: 16.0,
        letterSpacing: 1.2,
      ),
      border: const OutlineInputBorder(),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade500),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: secondaryColor,
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.grey.shade200,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.elliptical(100, 10),
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: secondaryColor,
      onSecondary: onSecondary,
      background: background,
      onBackground: onBackground,
      brightness: Brightness.light,
      error: Colors.red,
      onError: Colors.white,
    ),
  );
}
