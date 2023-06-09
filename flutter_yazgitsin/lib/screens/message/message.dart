import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => baglantiAl());
    kameradanYukle();
  }

  File? yuklenecekDosya;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? indirmeBaglantisi;

  baglantiAl() async{
    String baglanti = await FirebaseStorage.instance
    .ref()
    .child("profilresimleri")
    .child(auth.currentUser!.uid)
    .child("kullaniciResmi").getDownloadURL();

    setState(() async{
      indirmeBaglantisi = await baglanti;
    });
  }

  kameradanYukle() async{
    var alinanDosya = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() async{
      yuklenecekDosya = await File(alinanDosya!.path);
    });

    Reference referansYolu = await FirebaseStorage.instance
    .ref()
    .child("profilresimleri")
    .child(auth.currentUser!.uid)
    .child("kullaniciResmi");

    UploadTask yuklemeGorevi = referansYolu.putFile(yuklenecekDosya!);
    String url = await (await yuklemeGorevi.whenComplete(() => print("Fotoğraf Yüklendi"))).ref.getDownloadURL();
    setState(() async{
      indirmeBaglantisi = await url;
    });
  }

  String imageUrl = '';


  TextEditingController sendMessage = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference mesaj = _firestore.collection("mesajlar");

    return Padding(
      padding: const EdgeInsets.only(bottom: 12,left: 12,right: 12),
      child: TextFormField(
        controller: sendMessage,
        decoration: InputDecoration(
            hintText: "Mesaj Yaz..",
            prefixIcon: Icon(
              Icons.tag_faces_rounded,
              color: Colors.deepOrangeAccent,
            ),
            suffixIcon: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () async {
                  Map<String,dynamic> mesajData = {
                    "mesaj": sendMessage.text,
                  };
                  final user = await FirebaseAuth.instance.currentUser;
                  final userUid = user!.uid;
                  final ref = FirebaseDatabase.instance.ref();
                  final userName = await ref.child(userUid).child("name").get();
                  final userId = await ref.child(userUid).child("id").get();

                  Map<String,dynamic> data = await {
                    "name": userName.value,
                    "image":indirmeBaglantisi.toString(),
                    "id": userId.value,
                    "mesaj":sendMessage.text
                  };
                  await FirebaseFirestore.instance
                  .collection("mesajlar")
                  .doc()
                  .set(data);
                },
                child: Icon(Icons.send)
                ),
                ),
      ),
    );
  }
}