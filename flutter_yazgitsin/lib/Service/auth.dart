import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_yazgitsin/constants/constants.dart';
import 'package:flutter_yazgitsin/constants/routes.dart';
import 'package:flutter_yazgitsin/screens/auth/welcome/welcome.dart';


class AuthService{
  static AuthService instance = AuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> loginService(String email,String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pop(context);
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showMessage(e.toString());
      return false;
    }
  }

  Future<bool> signUpService(String name,String email,String password,BuildContext context) async{
    try {
      showLoaderDialog(context);
      Map<String,dynamic> kullanicilar = {
        "email": email,
        "password": password,
        "name":name
      };
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
        _firestore.collection("users")
        .doc()
        .set(kullanicilar)
      });
final user= await FirebaseAuth.instance.currentUser;
final userUid=user!.uid;
      var ref=FirebaseDatabase.instance.ref(userUid);
      Map<String,dynamic> kullaniciAdd={
        "name":name,
        "email":email,
        "password":password,
        "profiUrl":""
      };
      await ref.set(kullaniciAdd).then((value) => print("Kayıt Ok"));

      Navigator.pop(context);
      return true;
    }on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showMessage(e.toString());
      return false;
    }
  }

  void logout(BuildContext context) async{
    await _auth.signOut();
    MainRoutes.instance.pushAndRemoved(widget: Welcome(), context: context);
  }
}