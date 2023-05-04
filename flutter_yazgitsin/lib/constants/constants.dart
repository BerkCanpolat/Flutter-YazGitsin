import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage(String message){
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.purple,
    textColor: Colors.white,
    fontSize: 16,
  );
}


showLoaderDialog(BuildContext context){
  AlertDialog alert = AlertDialog(
    content: Builder(builder: (context){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          Text("Yükleniyor.."),
        ],
      );
    }
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context, 
    builder: (BuildContext context){
    return alert;
  });
}


bool loginValidate(String email, String password){
  if(email.isEmpty && password.isEmpty){
    showMessage("Lütfen Boş alanları doldurun!");
    return false;
  }else if(email.isEmpty){
    showMessage("E-mail boş");
    return false;
  }else if(password.isEmpty){
    showMessage("Şifre boş");
    return false;
  }else{
    return true;
  }
}

bool signUpValidate(String email, String password,String name, String phone){
  if(email.isEmpty && password.isEmpty && name.isEmpty && phone.isEmpty){
    showMessage("Lütfen Boş alanları doldurun!");
    return false;
  }else if(email.isEmpty){
    showMessage("E-mail boş");
    return false;
  }else if(name.isEmpty){
    showMessage("İsim boş");
    return false;
  }else if(phone.isEmpty){
    showMessage("Telefon boş");
    return false;
  }else if(password.isEmpty){
    showMessage("Şifre boş");
    return false;
  }else{
    return true;
  }
  
}
