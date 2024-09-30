import 'package:flutter/material.dart';
import 'package:todo_app/src/constants/app_sizes.dart';
import 'package:todo_app/src/theme/colors.dart';

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
  listTileTheme: ListTileThemeData(
    tileColor: darkSecondaryColor,
    titleTextStyle: const TextStyle(
      color: darkOnSurfaceColor,
      fontSize: 18,
      fontWeight: FontWeight.normal,
      decorationThickness: 2,
    ),
    subtitleTextStyle:
        const TextStyle(color: darkOnSecondaryColor, fontSize: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Sizes.p4),
    ),
  ),

  // [Check Box Theme]
  checkboxTheme: const CheckboxThemeData(shape: CircleBorder()),

  // [Elevate Button Theme]
  elevatedButtonTheme: const ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(darkPrimaryColor),
      foregroundColor: WidgetStatePropertyAll(darkOnPrimaryColor),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.p4)))),
    ),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: darkSecondaryColor,
  ),
);
