import 'package:flutter/material.dart';
import 'package:flutter_yazgitsin/constants/theme.dart';
import 'package:flutter_yazgitsin/screens/auth/welcome/welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      theme: themeData,
    );
  }
}