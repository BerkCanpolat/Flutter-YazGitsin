import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_yazgitsin/Service/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_yazgitsin/constants/images.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_yazgitsin/constants/routes.dart';
import 'package:flutter_yazgitsin/screens/account/account.dart';
import 'package:flutter_yazgitsin/screens/message/message.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController sendMessage = TextEditingController();
  final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    CollectionReference mesaj = _firestore.collection("mesajlar");

    return Scaffold(
      appBar: AppBar(
        title: Text("YazGitsin"),
        actions: [
          IconButton(onPressed: (){
            MainRoutes.instance.pushMain(widget: Account(), context: context);
          }, icon: Icon(Icons.person))
        ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("mesajlar").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(snapshot.hasError){
              return Text("Bir hata meydana geldi");
            }
            if(snapshot == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }
            if(snapshot.hasData){
              List<DocumentSnapshot> listDocument = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: listDocument.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.orange,
                          child: ListTile(
                            subtitle: Text(listDocument[index]["mesaj"],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            title: Row(
                              children: [
                                Image.network(listDocument[index]["image"],scale: 25),
                                SizedBox(width: 10,),
                                Text(listDocument[index]["name"]),
                              ],
                            ),
                            
                          ),
                        );
                      },
                    ),
                  ),
                  Message()
                ],
              );
            }
            return Text("bla bla blaaa");
          },
        ),
        // bottomNavigationBar: Message(),
    );
  }
}
