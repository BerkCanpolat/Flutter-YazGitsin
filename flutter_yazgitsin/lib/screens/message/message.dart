import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  TextEditingController sendMessage = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference mesaj = _firestore.collection("mesajlar");

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
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
                  // await mesaj.doc(sendMessage.text).set(mesajData);
                  //

                  // final docUser = FirebaseFirestore.instance.collection("mesajlar").doc();
                  // final user = {
                  //   "id": docUser.id,
                  //   "mesaj": sendMessage.text,
                  // };
                  // await docUser.set(user);

                  final user = await FirebaseAuth.instance.currentUser;
                  final userUid = user!.uid;
                  final ref = FirebaseDatabase.instance.ref();
                  final userName = await ref.child(userUid).child("name").get();
                  final userImage = await ref.child(userUid).child("image").get();

                  Map<String,dynamic> data = {
                    "name": userName.value.toString(),
                    "image":userImage.value.toString(),
                    "mesaj":sendMessage.text
                  };
                  await FirebaseFirestore.instance
                  .collection("mesajlar")
                  .doc()
                  .set(data);
                },
                child: Icon(Icons.send))),
      ),
    );
  }
}