import 'package:flutter/material.dart';

final greenOrangeTheme = ThemeData.light().copyWith(
  colorScheme: const ColorScheme.light().copyWith(
    primary: const Color(0xFFF2F2F2),
    secondary: const Color(0xFF0DA64F),
    tertiary: const Color(0xFFF27405),
    background: const Color(0xFFF2F2F2),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF2F2F2),
  ),
  scaffoldBackgroundColor: const Color(0xFFF2F2F2),
  backgroundColor: const Color(0xFFF2F2F2),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 24,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w900,
      color: Color(0xFF0DA64F),
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      color: Color(0xFF0DA64F),
      decoration: TextDecoration.underline,
    ),
    labelLarge: TextStyle(
      color: Color(0xFF0DA64F),
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: 'Roboto',
      letterSpacing: 0,
    ),
    bodySmall: TextStyle(
      color: Color(0xFFF27405),
      fontWeight: FontWeight.w400,
      fontSize: 12,
      fontFamily: 'Roboto',
      letterSpacing: 0,
    ),

  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontSize: 15,
      color: Color(0xFF0DA64F),
      fontFamily: 'Heebo',
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: Color(0xFFF2F2F2),
    scrimColor: Color(0x11000000),
    elevation: 4,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        right: Radius.circular(20),
      ),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 14,
          color: Color(0xFF0DA64F),
          fontFamily: 'Roboto',
        ),
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        const Color(0x11000000),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.zero),
        ),
      ),
      side: MaterialStateProperty.all<BorderSide>(BorderSide.none),
      elevation: MaterialStateProperty.all<double>(0),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      fixedSize: MaterialStateProperty.all<Size>(
        const Size.fromHeight(38),
      ),
    ),
  ),
);