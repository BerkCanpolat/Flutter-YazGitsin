import 'package:flutter/material.dart';
import 'package:flutter_yazgitsin/Service/auth.dart';
import 'package:flutter_yazgitsin/constants/theme.dart';
import 'package:flutter_yazgitsin/firebase_options.dart';
import 'package:flutter_yazgitsin/screens/auth/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_yazgitsin/screens/home/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: AuthService.instance.getAuthChange,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Home();
          }else{
            return Welcome();
          }
        },
      ),
      theme: themeData,
    );
  }
}