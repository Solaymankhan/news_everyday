import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/constants/image_paths.dart';
import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/buttonsDecoration/newsButton.dart';
import 'package:bangladesh_news/utils/decorations/buttonsDecoration/roundedSmallIconButton.dart';
import 'package:bangladesh_news/utils/decorations/conponants/appBarWithBackButton.dart';
import 'package:bangladesh_news/utils/lists/newsSiteList.dart';
import 'package:bangladesh_news/view/emptyPage.dart';
import 'package:bangladesh_news/view/newsPage.dart';
import 'package:bangladesh_news/viewModel/controllers/favouriteController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class favouritesPage extends StatefulWidget {
  favouritesPage({Key? key}) : super(key: key);
  @override
  State<favouritesPage> createState() => _favouritesPageState();
}

class _favouritesPageState extends State<favouritesPage> {
  List new_newsList=[];
  final favouriteController favourite_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    new_newsList = favourite_controller.newNewsSiteList
        .where((element) => element['favourite'] == true)
        .toList();
    return Scaffold(
      appBar: appBarWithBackButton(favourites_txt,context),
      body: SafeArea(
        child:
        new_newsList.isEmpty?
        emptyPage(asset: empty_box_icon, text: favourite_empty_txt)
            :
        GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250, mainAxisExtent: 100),
              itemCount: new_newsList.length,
              itemBuilder: (contxt, index) {
                return newsButton(
                  img: new_newsList[index]["image"],
                  txt: new_newsList[index]["title"],
                  is_favourite: new_newsList[index]
                  ['favourite'],
                  news_onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => newsPage(
                                news_page_url: new_newsList[index]
                                ['newsLink'])));
                  },
                  favourite_onTap: () {
                    favourite_controller.favourite(new_newsList[index]["title"]);
                    setState(() {});
                  },
                );
              }).marginOnly(left: 5,right: 5)
      ),
    );
  }
}
