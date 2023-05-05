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
          IconButton(
              onPressed: () {
                MainRoutes.instance
                    .pushMain(widget: Account(), context: context);
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("mesajlar").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Bir hata meydana geldi");
          }
          if (snapshot == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            List<DocumentSnapshot> listDocument = snapshot.data!.docs;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: listDocument.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(snapshot.data!.docs.toString()),
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.delete,color: Colors.red,),
                        ),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (direction) {
                          return showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text("Mesajı Sil"),
                              content: Text("Mesajı Silmek İstediğinize Emin Misiniz?"),
                              actions: [
                                TextButton(
                                  onPressed: () async{
                                  await listDocument[index].reference.delete();
                                  Navigator.pop(context);
                                }, child: Text("Evet"),
                                ),
                                TextButton(
                                  onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Hayır"),
                                ),
                              ],
                            );
                          });
                        },
                        child: Card(
                          color: Colors.orange,
                          child: ListTile(
                            subtitle: Text(
                              listDocument[index]["mesaj"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            title: Text(listDocument[index]["name"]),
                            leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  listDocument[index]["image"],
                                  scale: 20,
                                  fit: BoxFit.cover,
                                )),
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
