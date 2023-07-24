import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/decorations/buttonsDecoration/roundedSmallIconButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appBarWithBackButton(txt, context) {
  return AppBar(
    automaticallyImplyLeading: false,
    shadowColor: Colors.transparent,
    backgroundColor: Colors.transparent,
    leading: roundedSmallIconButton(
        icon: CupertinoIcons.back,
        icon_clr: redColor,
        btn_clr: Colors.transparent,
        onTap: () {
          Navigator.pop(context);
        }),
    title: Text(
      txt,
      style: TextStyle(color: blackColor),
    ),
  );
}
