import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class roundedSmallIconButton extends StatelessWidget {
  roundedSmallIconButton({Key? key,required this.icon,required this.icon_clr,required this.btn_clr,required this.onTap}) : super(key: key);

  var icon,onTap,btn_clr,icon_clr;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: btn_clr,
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onTap,
        child: Ink(
          child: Icon(icon,color: icon_clr),
        ),
      ),
    ).box.height(40).width(40).make();
  }
}
