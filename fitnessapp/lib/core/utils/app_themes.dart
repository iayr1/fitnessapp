import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    accentColor: Colors.green,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.black),
    ),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.green,
    textTheme: TextTheme(
      bodyText1: TextStyle(color: Colors.white),
    ),
  );
}
