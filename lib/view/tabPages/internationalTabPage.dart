

import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/conponants/newsGridview.dart';
import 'package:bangladesh_news/utils/lists/newsSiteList.dart';
import 'package:flutter/material.dart';

class internationalTabPage extends StatefulWidget {
  const internationalTabPage({Key? key}) : super(key: key);

  @override
  State<internationalTabPage> createState() => _internationalTabPageState();
}

class _internationalTabPageState extends State<internationalTabPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return newsGridview(category:international_txt);
  }
}
