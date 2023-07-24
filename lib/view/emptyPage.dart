import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:velocity_x/velocity_x.dart';

class emptyPage extends StatelessWidget {
  emptyPage({Key? key,required this.asset,required this.text}) : super(key: key);

  var asset,text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(asset,width: 100,),
            10.heightBox,
            Text(text,style: TextStyle(color: blueGreyColor,fontWeight: FontWeight.w500),)
          ],
        ).centered(),
      ),
    );
  }
}
