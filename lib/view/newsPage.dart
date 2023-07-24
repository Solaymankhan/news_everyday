import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/constants/image_paths.dart';
import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/view/emptyPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class newsPage extends StatelessWidget {
  newsPage({Key? key, required this.news_page_url}) : super(key: key);
  var news_page_url;
  RxString is_loading = 'loading'.obs;

  @override
  Widget build(BuildContext context) {
    final WebViewController controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (_) {
          is_loading.value = "finished_loading";
        },
        onWebResourceError: (_) {
          is_loading.value = "error_occued";
        },

      ))
      ..loadRequest(Uri.parse(news_page_url));
    return WillPopScope(
      onWillPop: () async {
        if (await controller.canGoBack()) {
          controller.goBack();
          return false;
        }
        return true;
      },
      child: Scaffold(
        body: Obx(
          () => SafeArea(child: availableNews(is_loading.value, controller)),
        ),
      ),
    );
  }
}

Widget availableNews(is_loading, controller) {
  if (is_loading == 'loading') {
    return Center(
      child: CupertinoActivityIndicator(),
    );
  } /*else if (is_loading == "error_occued") {
    return emptyPage(asset: error_icon, text: something_wrong_txt);
  }*/
  return Stack(
    children: [
      WebViewWidget(
        controller: controller,
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: FloatingActionButton(
          onPressed: () {
            controller.reload();
          },
          backgroundColor: yellowGreyColor,
          child: Icon(CupertinoIcons.refresh_circled_solid,color: blueGreyColor,),
        ).marginOnly(right: 10,bottom: 20),
      )
    ],
  );
}
