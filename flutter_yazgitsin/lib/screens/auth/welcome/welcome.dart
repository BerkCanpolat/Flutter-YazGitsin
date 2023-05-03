import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_yazgitsin/constants/images.dart';
import 'package:flutter_yazgitsin/constants/routes.dart';
import 'package:flutter_yazgitsin/screens/auth/Login/login.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_button.dart';
import 'package:flutter_yazgitsin/widgets/Yazgitsin_title.dart';
import 'package:neopop/neopop.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: kToolbarHeight,),
            Center(
                child: YazGitsinTitle(
              title: "Epostanızı kullanarak bir",
              subtitle: "hesap oluşturun",
            )),
            SizedBox(
              height: 30,
            ),
            Image.asset(MainImages.instance.welcomeMain),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: NeoPopTiltedButton(
                  isFloating: true,
                  onTapUp: (){
                    MainRoutes.instance.pushMain(widget: Login(), context: context);
                  },
                  decoration: NeoPopTiltedButtonDecoration(
                    color: Colors.orange,
                    plunkColor: Color.fromARGB(255, 170, 109, 16),
                    shadowColor: Color.fromARGB(255, 129, 79, 3),
                    showShimmer: true,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 106.0,vertical: 15),
                    child: Row(
                      children: [
                        Icon(Icons.email,color: Colors.white,),
                        SizedBox(width: 12,),
                        Text("Email ile giriş yap",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                      ],
                    )
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
