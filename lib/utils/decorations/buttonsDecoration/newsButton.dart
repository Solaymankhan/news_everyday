import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/constants/image_paths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class newsButton extends StatelessWidget {
  newsButton(
      {Key? key, required this.img, required this.txt, required this.is_favourite,
        required this.news_onTap,required this.favourite_onTap})
      : super(key: key);

  var img, txt,is_favourite,news_onTap,favourite_onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          Container(
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(img),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)))),
          Expanded(
            child: Text(
              txt,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.w500),
            )
                .box
                .width(double.infinity)
                .customRounded(BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)))
                .alignCenterLeft
                .color(yellowGreyColor)
                .padding(EdgeInsets.only(left: 7,right: 35))
                .make(),
          ),
        ]),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: news_onTap,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: SvgPicture.asset(
            is_favourite?favorite_selected_icon:favorite_not_selected_icon,
            width: 25,
            height: 25,
          ).marginOnly(right: 5,bottom: 1.5).onTap(favourite_onTap),
        ),
      ],
    ).box.border(width: 0.5,color: greyColor).customRounded(BorderRadius.circular(10)).make().marginAll(5);

  }
}
