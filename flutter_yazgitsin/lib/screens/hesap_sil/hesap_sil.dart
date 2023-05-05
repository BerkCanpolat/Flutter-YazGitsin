import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_yazgitsin/Service/auth.dart';
import 'package:flutter_yazgitsin/constants/routes.dart';
import 'package:flutter_yazgitsin/screens/auth/welcome/welcome.dart';
import 'package:flutter_yazgitsin/screens/passwordChange/password_change.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class HesapSil extends StatefulWidget {
  const HesapSil({super.key});

  @override
  State<HesapSil> createState() => _HesapSilState();
}

class _HesapSilState extends State<HesapSil> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hesap Sİl"),),
      body: Column(
        children: [
          TextFormField(
            controller: email,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextFormField(
            controller: password,
            decoration: InputDecoration(labelText: "Password"),),
            ElevatedButton(onPressed: () async{
              await AuthServiceTwo().deleteUser(email.text, password.text);
            }, child: Text("Sil")),
        ],
      ),
    );
  }
}

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final FirebaseStorage userCollection =
      FirebaseStorage.instance;

  Future heyo() {
    return userCollection.ref(uid).delete();
  }
}

class AuthServiceTwo {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future deleteUser(String email, String password) async {
    try {
      User? user = await _auth.currentUser;
      AuthCredential credentials =
          EmailAuthProvider.credential(email: email, password: password);
      print(user);
      UserCredential result = await user!.reauthenticateWithCredential(credentials);
      await DatabaseService(uid: result.user!.email.toString()).uid; // called from database class
      await result.user?.delete();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}