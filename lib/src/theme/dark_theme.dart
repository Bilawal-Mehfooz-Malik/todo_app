import 'package:flutter/material.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/theme/colors.dart';

const _shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(Sizes.p4)));

final darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  // [Color Scheme]
  colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    primary: darkPrimaryColor,
    onPrimary: darkOnPrimaryColor,
    secondary: darkSecondaryColor,
    onSecondary: darkOnSecondaryColor,
    error: darkErrorColor,
    onError: darkOnErrorColor,
    surface: darkSurfaceColor,
    onSurface: darkOnSurfaceColor,
  ),

  // [List Tile Theme]
  listTileTheme: const ListTileThemeData(
    tileColor: darkSecondaryColor,
    titleTextStyle: TextStyle(
      color: darkOnSurfaceColor,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      decorationThickness: 2,
    ),
    subtitleTextStyle: TextStyle(color: darkOnSecondaryColor, fontSize: 16),
    shape: _shape,
  ),

  // [Check Box Theme]
  checkboxTheme: const CheckboxThemeData(shape: CircleBorder()),

  // [Elevate Button Theme]
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(darkPrimaryColor),
      foregroundColor: WidgetStatePropertyAll(darkOnPrimaryColor),
      shape: WidgetStatePropertyAll(_shape),
    ),
  ),

  // [Dialog theme]
  dialogTheme: const DialogTheme(
    shape: _shape,
    backgroundColor: darkSecondaryColor,
    contentTextStyle: TextStyle(color: darkOnPrimaryColor),
  ),

  // [Icon Button Theme]
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStatePropertyAll(EdgeInsets.zero),
    ),
  ),

  // [Card Theme]
  cardTheme: const CardTheme(color: darkSecondaryColor, shape: _shape),
);
