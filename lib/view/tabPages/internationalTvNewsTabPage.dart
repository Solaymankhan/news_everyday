import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/conponants/newsGridview.dart';
import 'package:bangladesh_news/utils/lists/newsSiteList.dart';
import 'package:flutter/material.dart';

class internationalTvNewsTabPage extends StatefulWidget {
  const internationalTvNewsTabPage({Key? key}) : super(key: key);

  @override
  State<internationalTvNewsTabPage> createState() => _internationalTvNewsTabPageState();
}

class _internationalTvNewsTabPageState extends State<internationalTvNewsTabPage> with AutomaticKeepAliveClientMixin{
  @override
  bool get wantKeepAlive => true;

  Widget build(BuildContext context) {
    return newsGridview(category:international_tv_txt);
  }
}
