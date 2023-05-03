import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class YazGitsinButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  const YazGitsinButton({super.key,required this.title,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 40,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(Icons.email),
        label: Text(title,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
