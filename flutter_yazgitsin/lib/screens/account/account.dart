import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 7.0,color: Colors.orangeAccent)
            ),
            child: Center(child: CircleAvatar(
              maxRadius: 100,
              child: Icon(Icons.person,size: 190,)
              ),
              ),
          ),
          SizedBox(height: 12,),
          Text("${user!.email}",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 30,),
          ListTile(
            onTap: (){},
            title: Text("Ayarlar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            leading: Icon(Icons.settings),
          ),
          SizedBox(height: 12,),
          ListTile(
            onTap: (){},
            title: Text("Şifre Değiştir",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            leading: Icon(Icons.change_circle_outlined),
          ),
          SizedBox(height: 12,),
          ListTile(
            onTap: (){},
            title: Text("Destek",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            leading: Icon(Icons.support_agent),
          ),
          SizedBox(height: 12,),
          ListTile(
            onTap: (){},
            title: Text("Hesabı Sil",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            leading: Icon(Icons.person_off_outlined),
          ),
          SizedBox(height: 12,),
          ListTile(
            onTap: (){},
            title: Text("Çıkış Yap",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            leading: Icon(Icons.login_outlined),
          ),
          SizedBox(height: 30,),
          Text("Version 1.0.0")
        ],
      ),
    );
  }
}