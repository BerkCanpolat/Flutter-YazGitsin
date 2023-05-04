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
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        titleTextStyle: TextStyle(color: Colors.purple,fontSize: 20,fontWeight: FontWeight.bold
        ),
        centerTitle: true
    )
    );

OutlineInputBorder _border =
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.green.withOpacity(0.5),
        style: BorderStyle.solid
        ),
        );
