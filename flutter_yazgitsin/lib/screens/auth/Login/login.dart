import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_yazgitsin/constants/images.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_button.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_title.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: kToolbarHeight + 15,
              ),
              Text(
                "Login",
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
                "Login to your account",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Image.asset(MainImages.instance.loginMain),
              TextFormField(
                decoration: InputDecoration(
                  label: Text("Email"),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: isVisible,
                decoration: InputDecoration(
                  label: Text("Password"),
                  suffixIcon: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: (){
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Icon(isVisible ? Icons.visibility : Icons.visibility_off,color: Colors.purple,)),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                    width: 300,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Login"),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                      ),
                    ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
