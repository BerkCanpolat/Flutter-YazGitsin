import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_yazgitsin/Service/auth.dart';
import 'package:flutter_yazgitsin/constants/routes.dart';
import 'package:flutter_yazgitsin/screens/passwordChange/password_change.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => baglantiAl());
  }

  File? yuklenecekDosya;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? indirmeBaglantisi;

  baglantiAl() async {
    String baglanti = await FirebaseStorage.instance
        .ref()
        .child("profilresimleri")
        .child(auth.currentUser!.uid)
        .child("kullaniciResmi")
        .getDownloadURL();

    setState(() {
      indirmeBaglantisi = baglanti;
    });
  }

  kameradanYukle() async {
    var alinanDosya = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      yuklenecekDosya = File(alinanDosya!.path);
    });

    Reference referansYolu = FirebaseStorage.instance
        .ref()
        .child("profilresimleri")
        .child(auth.currentUser!.uid)
        .child("kullaniciResmi");

    UploadTask yuklemeGorevi = referansYolu.putFile(yuklenecekDosya!);
    String url = await (await yuklemeGorevi
            .whenComplete(() => print("Fotoğraf Yüklendi")))
        .ref
        .getDownloadURL();
    setState(() {
      indirmeBaglantisi = url;
    });
  }

  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 7.0, color: Colors.orangeAccent)),
            child: Center(
              child: CircleAvatar(
                  maxRadius: 100,
                  child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: kameradanYukle,
                      child: indirmeBaglantisi == null
                          ? Icon(
                              Icons.person,
                              size: 190,
                            )
                          : ClipOval(
                              child: Image.network(
                              "${indirmeBaglantisi}",
                              width: 200,
                              height: 200,
                              fit: BoxFit.cover,
                            )))),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "${user!.email}",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: () {},
            title: Text(
              "Ayarlar",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.settings),
          ),
          Divider(thickness: 1.6),
          ListTile(
            onTap: () {
              MainRoutes.instance.pushMain(widget: PassWordChange(), context: context);
            },
            title: Text(
              "Şifre Değiştir",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.change_circle_outlined),
          ),
          Divider(thickness: 1.6),
          ListTile(
            onTap: () {},
            title: Text(
              "Destek",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.support_agent),
          ),
          Divider(thickness: 1.6),
          ListTile(
            onTap: () async {},
            title: Text(
              "Hesabı Sil",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.person_off_outlined),
          ),
          Divider(thickness: 1.6),
          ListTile(
            onTap: () {
              AuthService.instance.logout(context);
            },
            title: Text(
              "Çıkış Yap",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            leading: Icon(Icons.login_outlined),
          ),
          Divider(thickness: 1.6),
          Text("Version 1.0.0")
        ],
      ),
    );
  }
}
