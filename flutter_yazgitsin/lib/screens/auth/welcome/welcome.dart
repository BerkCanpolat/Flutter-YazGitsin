import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_yazgitsin/constants/images.dart';
import 'package:flutter_yazgitsin/constants/routes.dart';
import 'package:flutter_yazgitsin/screens/auth/Login/login.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_button.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_title.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: YazGitsinTitle(
              title: "Epostanızı kullanarak bir",
              subtitle: "hesap oluşturun",
            )),
            SizedBox(
              height: 30,
            ),
            Image.asset(MainImages.instance.welcomeMain),
            YazGitsinButton(title: "Email ile giriş yap",onPressed: (){
              MainRoutes.instance.pushMain(widget: Login(), context: context);
            },),
          ],
        ),
      ),
    );
  }
}
