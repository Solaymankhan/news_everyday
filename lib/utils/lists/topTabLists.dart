import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/textDecorations/topTabTextDecorations.dart';
import 'package:bangladesh_news/view/tabPages/internationalTabPage.dart';
import 'package:bangladesh_news/view/tabPages/internationalTvNewsTabPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

List<Widget> topTabTextsList = [
  Tab(
    child: topTabTextDecorations(txt: international_tv_txt),
  ),
  Tab(
    child: topTabTextDecorations(txt: international_txt),
  ),
];

RxList<Widget> topTabPagesList = [
  internationalTvNewsTabPage(),
  internationalTabPage(),
].obs;
