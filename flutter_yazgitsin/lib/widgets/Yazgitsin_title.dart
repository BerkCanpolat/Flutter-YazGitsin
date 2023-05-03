import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class YazGitsinTitle extends StatelessWidget {
  final String title,subtitle;
  const YazGitsinTitle({super.key, required this.title,required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: kToolbarHeight + 15,
        ),
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 29,
            fontWeight: FontWeight.bold
            ),
        ),
        Text(
          subtitle,
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 29,
            fontWeight: FontWeight.bold
            ),
        ),
      ],
    );
  }
}
