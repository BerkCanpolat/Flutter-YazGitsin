import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.orange,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorBorder: _border,
      enabledBorder: _border,
      focusedBorder: _border,
      disabledBorder: _border,
      focusedErrorBorder: _border,
      labelStyle: TextStyle(color: Colors.deepPurple),
      suffixIconColor: Colors.purple,
      fillColor: Colors.green,
      
    ));

OutlineInputBorder _border =
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.grey,
        style: BorderStyle.solid
        ),
        );