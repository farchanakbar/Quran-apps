import 'package:flutter/material.dart';

const colorSatu = Color(0xFF331D2C);
const colorDua = Color(0xFF3F2E3E);
const colorTiga = Color(0xFFA78295);
const colorEmpat = Color(0xFFEFE1D1);

ThemeData themeLight = ThemeData(
    primaryColor: colorSatu,
    scaffoldBackgroundColor: colorSatu,
    appBarTheme: const AppBarTheme(
      backgroundColor: colorDua,
    ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: colorEmpat),
      bodyLarge: TextStyle(color: colorEmpat),
      bodyMedium: TextStyle(color: colorEmpat),
      titleSmall: TextStyle(color: colorEmpat),
      titleMedium: TextStyle(color: colorEmpat),
      titleLarge: TextStyle(color: colorEmpat),
      labelSmall: TextStyle(color: colorEmpat),
      labelMedium: TextStyle(color: colorEmpat),
      labelLarge: TextStyle(color: colorEmpat),
    ));
