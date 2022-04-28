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
  snackBarTheme: SnackBarThemeData(
    backgroundColor: const Color(0xFF0DA64F),
    behavior: SnackBarBehavior.floating,
    elevation: 2,
    contentTextStyle: const TextStyle(
      color: Color(0xFFF2F2F2),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
      side: const BorderSide(
        color: Color(0xFFD2D6D9),
        width: 2,
      ),
    ),
  ),
  textTheme: const TextTheme(
    headlineSmall: TextStyle(
      fontSize: 24,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w900,
      color: Color(0xFF0DA64F),
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      color: Color(0xFF767676),
    ),
    titleMedium: TextStyle(
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      color: Color(0xFF0DA64F),
      decoration: TextDecoration.underline,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w300,
      color: Color(0xFFF27405),
    ),
    labelLarge: TextStyle(
      color: Color(0xFF0DA64F),
      fontWeight: FontWeight.w500,
      fontSize: 14,
      fontFamily: 'Roboto',
      letterSpacing: 0,
    ),
    labelMedium: TextStyle(
      color: Color(0xFFF27405),
      fontWeight: FontWeight.w300,
      fontSize: 13,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      decoration: TextDecoration.underline,
    ),
    bodyMedium: TextStyle(
      color: Color(0xFF5E5E5E),
      fontWeight: FontWeight.w400,
      fontSize: 14,
      fontFamily: 'Roboto',
      letterSpacing: 0,
      height: 1,
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
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16,
          color: Color(0xFF0DA64F),
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        ),
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        const Color(0x11000000),
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
      side: MaterialStateProperty.all<BorderSide>(
        const BorderSide(
          color: Color(0xFF0DA64F),
          width: 2,
        ),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color(0xFFF2F2F2),
      ),
      elevation: MaterialStateProperty.all<double>(2),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
      //fixedSize: MaterialStateProperty.all<Size>(const Size.fromHeight(38),),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      overlayColor: MaterialStateProperty.all<Color>(const Color(0xFFF27405).withAlpha(80),),
    ),
  ),
  bannerTheme: const MaterialBannerThemeData(
    backgroundColor: Color(0x00F2F2F2),
  ),
  dialogTheme: DialogTheme(
    backgroundColor: const Color(0xFFF2F2F2),
    titleTextStyle: const TextStyle(
      color: Color(0xFF5E5E5E),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 24,
    ),
    contentTextStyle: const TextStyle(
      color: Color(0xFF5E5E5E),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        color: Color(0xFFD2D6D9),
        width: 3,
      ),
      borderRadius: BorderRadius.circular(28),
    ),
  ),
);
