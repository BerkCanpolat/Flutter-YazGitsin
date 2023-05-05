import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:neopop/neopop.dart';
import 'package:firebase_auth/firebase_auth.dart';



class PassWordChange extends StatefulWidget {
  const PassWordChange({super.key});

  @override
  State<PassWordChange> createState() => _PassWordChangeState();
}

class _PassWordChangeState extends State<PassWordChange> {


  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();

  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;

  changePassword({email, oldPassword, newPassword}) async{
    var cred = EmailAuthProvider.credential(email: email, password: oldPassword);

    await currentUser!.reauthenticateWithCredential(cred).then((value) => {
      currentUser!.updatePassword(newPassword)
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Şifreni Değiştir"),),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: oldPassword,
              decoration: InputDecoration(
                labelText: "Eski Şifre"
              ),
            ),
            SizedBox(height: 25,),
            TextFormField(
              controller: newPassword,
              decoration: InputDecoration(
                labelText: "Yeni Şifre"
              ),
            ),
            SizedBox(height: 40,),
                NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: () async{
                    await changePassword(
                      email: "oldu@oldu.com",
                      oldPassword: oldPassword.text,
                      newPassword: newPassword.text
                    );
                    print("Password Change");
                  },
                  decoration: NeoPopTiltedButtonDecoration(
                    color: Colors.orange,
                    plunkColor: Color.fromARGB(255, 170, 109, 16),
                    shadowColor: Color.fromARGB(255, 129, 79, 3),
                    showShimmer: true,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 120.0, vertical: 15),
                    child: Text(
                      "Şifreni Değiştir",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}