import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/constants/image_paths.dart';
import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/buttonsDecoration/newsButton.dart';
import 'package:bangladesh_news/utils/decorations/buttonsDecoration/roundedSmallIconButton.dart';
import 'package:bangladesh_news/utils/lists/newsSiteList.dart';
import 'package:bangladesh_news/view/emptyPage.dart';
import 'package:bangladesh_news/view/newsPage.dart';
import 'package:bangladesh_news/viewModel/controllers/favouriteController.dart';
import 'package:bangladesh_news/viewModel/controllers/searchController.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class searchPage extends StatefulWidget {
  searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  final search_controller = Get.put(searchController());
  final favouriteController favourite_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: TextFormField(
          autofocus: true,
          cursorColor: blackColor,
          decoration: InputDecoration(
            hintText: 'Search here...',
            contentPadding: EdgeInsets.all(8),
            focusedBorder: OutlineInputBorder(
              // Add this block
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: greyColor, // Set focused border color
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                color: greyColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                width: 1,
                color: greyColor, // Set unfocused border color
              ),
            ),
          ),
          onChanged: (val) {
            EasyDebounce.debounce(
                'search_debounce',                 // <-- An ID for this particular debouncer
                Duration(milliseconds: 600),    // <-- The debounce duration
                    () => search_controller.searchPaper(val)                // <-- The target method
            );
          },
        ).box.height(40).make(),
      ),
      body: SafeArea(
        child: Obx(
          () =>
          search_controller.search_newsList.isEmpty?
          emptyPage(asset: empty_folder_icon, text: no_newspaper_txt)
              :
              GridView.builder(
              physics: BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250, mainAxisExtent: 100),
              itemCount: search_controller.search_newsList.length,
              itemBuilder: (contxt, index) {
                return newsButton(
                  img: search_controller.search_newsList[index]["image"],
                  txt: search_controller.search_newsList[index]["title"],
                  is_favourite: search_controller.search_newsList[index]
                      ['favourite'],
                  news_onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => newsPage(
                                news_page_url: search_controller
                                    .search_newsList[index]['newsLink'])));
                  },
                  favourite_onTap: () {
                    favourite_controller.favourite(search_controller.search_newsList[index]["title"]);
                    setState(() {});
                  },
                );
              }),
        ).marginOnly(left: 5, right: 5),
      ),
    );
  }
}
