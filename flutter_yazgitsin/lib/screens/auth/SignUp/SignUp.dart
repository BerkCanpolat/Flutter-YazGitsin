import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_yazgitsin/Service/auth.dart';
import 'package:flutter_yazgitsin/constants/constants.dart';
import 'package:flutter_yazgitsin/constants/images.dart';
import 'package:flutter_yazgitsin/constants/routes.dart';
import 'package:flutter_yazgitsin/screens/auth/Login/login.dart';
import 'package:flutter_yazgitsin/screens/home/home.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_button.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_title.dart';
import 'package:neopop/neopop.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Üye Ol",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 29,
                    fontWeight: FontWeight.bold
                    // fontWeight: FontWeight.bold
                    ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Hemen Üye Olun",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: kToolbarHeight,),
              Card(
                elevation: 5.0,
                shadowColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: email,
                  decoration: InputDecoration(
                    label: Text("Email"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5.0,
                shadowColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: name,
                  decoration: InputDecoration(
                    label: Text("Name"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5.0,
                shadowColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  controller: phone,
                  decoration: InputDecoration(
                    label: Text("Phone"),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5.0,
                shadowColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextFormField(
                  controller: password,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    label: Text("Password"),
                    suffixIcon: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        child: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.purple,
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              NeoPopTiltedButton(
                isFloating: true,
                onTapUp: () async{
                  bool isValidate = signUpValidate(email.text, password.text, name.text, phone.text);
                  if(isValidate){
                    bool isLogined = await AuthService.instance.signUpService(name.text,email.text, password.text, context);
                    if(isLogined){
                      Navigator.pop(context);
                    } 
                  }
                },
                decoration: NeoPopTiltedButtonDecoration(
                  color: Colors.orange,
                  plunkColor: Color.fromARGB(255, 170, 109, 16),
                  shadowColor: Color.fromARGB(255, 129, 79, 3),
                  showShimmer: true,
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 130.0, vertical: 15),
                  child: Text(
                    "Hesap Oluştur",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Center(child: Text("Zaten Hesabın Var Mı?")),
              Center(
                child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      MainRoutes.instance.pushMain(widget: Login(), context: context);
                    },
                    child: Text(
                      "Giriş Yap",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
