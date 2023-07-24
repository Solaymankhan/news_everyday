import 'package:bangladesh_news/utils/decorations/buttonsDecoration/newsButton.dart';
import 'package:bangladesh_news/utils/lists/newsSiteList.dart';
import 'package:bangladesh_news/view/newsPage.dart';
import 'package:bangladesh_news/viewModel/controllers/favouriteController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class newsGridview extends StatefulWidget {
  newsGridview({Key? key, required this.category}) : super(key: key);
  String category;

  @override
  State<newsGridview> createState() => _newsGridviewState();
}

class _newsGridviewState extends State<newsGridview> {
  RxList new_newsList = [].obs;
  final favouriteController favourite_controller = Get.find();

  @override
  void initState() {
    new_newsList.value = favourite_controller.newNewsSiteList
        .where((element) => element["category"] == widget.category)
        .toList();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Obx(()=> GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250, mainAxisExtent: 100),
            itemCount: new_newsList.length,
            itemBuilder: (contxt, index) {
              return newsButton(
                img: new_newsList[index]["image"],
                txt: new_newsList[index]["title"],
                is_favourite: new_newsList[index]['favourite'],
                news_onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => newsPage(
                              news_page_url: new_newsList[index]['newsLink'])));
                },
                favourite_onTap: () {
                 favourite_controller.favourite(new_newsList[index]["title"]);
                  setState(() {});
                },
              );
            })
    );
  }
}
