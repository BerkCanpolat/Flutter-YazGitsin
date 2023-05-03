import 'package:flutter/material.dart';

class MainRoutes{
  static MainRoutes instance = MainRoutes();

  Future<dynamic> pushAndRemoved({required Widget widget,required BuildContext context}){
    return Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => widget), (route) => false);
  }

  Future<dynamic> pushMain({required Widget widget,required BuildContext context}){
    return Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => widget));
  }
}