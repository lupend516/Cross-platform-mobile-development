import 'package:flutter/material.dart';

const darkBg = Color(0xFF1E2738);
const accent = Color(0xFFFF7A00);
const cardBg = Color(0xFF2A3246);
const textLight = Colors.white70;
const textGrey = Colors.white38;

final ThemeData kDarkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: darkBg,
  colorScheme: ColorScheme.dark(
    primary: darkBg,
    secondary: accent,
    surface: darkBg,
  ),
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(
    backgroundColor: darkBg,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: accent,
    unselectedLabelColor: textLight,
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(color: accent, width: 3),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: cardBg,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: TextStyle(color: textGrey),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: accent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 16),
    ),
  ),
);
