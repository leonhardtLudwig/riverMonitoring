import 'package:flutter/material.dart';
class AppTheme {
  AppTheme();
  static Color prim = Colors.teal;
  static Color acc = Colors.orangeAccent;
  static ThemeData defTheme(){
    return ThemeData(
        primarySwatch: prim,
        accentColor: acc,
        //buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent,buttonColor:prim ),
      );
  }

}