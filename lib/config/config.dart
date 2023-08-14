import 'package:flutter/material.dart';

const smallDistance = 8.0;
const mediumDistance = 16.0;
const largeDistance = 24.0;
const xLargeDistance = 32.0;

const smallRadius = 8.0;
const mediumRadius = 16.0;
const largeRadius = 24.0;
const xLargeRadius = 32.0;

const primaryColor = Color(0xff4F4FEC);

//light colors
const backgroundColor = Color(0xffEEEBF8);
const surfaceColor = Color(0xffffffff);

//dark colors
const darkBackgroundColor = Color(0xff070f1e);
const darkSurfaceColor = Color(0xff1F1449);

const lightColorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: Colors.black,
  secondary: primaryColor,
  secondaryContainer: primaryColor,
  surface: surfaceColor,
  background: backgroundColor,
  error: Colors.red,
  onPrimary: primaryColor,
  onSecondary: primaryColor,
  onSurface: surfaceColor,
  onBackground: backgroundColor,
  onError: Colors.red,
  brightness: Brightness.light,
);

const darkColorScheme = ColorScheme(
  primary: primaryColor,
  primaryContainer: Colors.white,
  secondary: primaryColor,
  secondaryContainer: primaryColor,
  surface: darkSurfaceColor,
  background: darkBackgroundColor,
  error: Colors.red,
  onPrimary: primaryColor,
  onSecondary: primaryColor,
  onSurface: darkSurfaceColor,
  onBackground: darkBackgroundColor,
  onError: Colors.red,
  brightness: Brightness.dark,
);

ThemeData themeData(bool isDarkTheme, BuildContext context) {
  return ThemeData(
    canvasColor: (isDarkTheme) ? Colors.white : Colors.black,
    primaryColor: primaryColor,
    cardColor: (isDarkTheme) ? Colors.black : Colors.white,
    scaffoldBackgroundColor:
        (isDarkTheme) ? darkBackgroundColor : backgroundColor,
    iconTheme:
        IconThemeData(color: (isDarkTheme) ? Colors.white : Colors.black),
    colorScheme: (isDarkTheme) ? darkColorScheme : lightColorScheme,
  );
}
