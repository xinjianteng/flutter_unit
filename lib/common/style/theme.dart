import 'package:flutter/material.dart';

import '../values/values.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AColors.primaryBackground,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AColors.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AColors.accentColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AColors.primaryText,
      ),
      titleTextStyle: TextStyle(
        color: AColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AColors.primaryText,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AColors.primaryBackground,
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: AColors.accentColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: AColors.accentColor,
      unselectedLabelColor: AColors.secondaryText,
    ),
  );
}
