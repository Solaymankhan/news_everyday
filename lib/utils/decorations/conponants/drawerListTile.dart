

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class drawerListTile extends StatelessWidget {
  drawerListTile({Key? key,required this.icon,required this.txt,required this.onTap}) : super(key: key);

  var txt,icon;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SvgPicture.asset(icon,height: 25,width: 25,),
        title: Text(txt),
        onTap: onTap
    );
  }
}
