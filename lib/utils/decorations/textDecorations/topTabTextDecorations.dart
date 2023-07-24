


import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class topTabTextDecorations extends StatelessWidget {
  topTabTextDecorations({Key? key,required this.txt}) : super(key: key);
  var txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(color: blackColor),
    );
  }
}
