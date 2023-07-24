
import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class titleTextDecoration extends StatelessWidget {
  titleTextDecoration({Key? key,required this.txt}) : super(key: key);
  var txt;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(color: blackColor,fontWeight: FontWeight.w500),
    );
  }
}
