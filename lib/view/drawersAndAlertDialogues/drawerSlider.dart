import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/constants/image_paths.dart';
import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/conponants/drawerListTile.dart';
import 'package:bangladesh_news/view/favouritesPage.dart';
import 'package:bangladesh_news/view/privacyPage.dart';
import 'package:bangladesh_news/view/termsPage.dart';
import 'package:bangladesh_news/viewModel/controllers/drawerController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class drawerSlider extends StatelessWidget {
  drawerSlider({Key? key}) : super(key: key);

  final drawerController drawer_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), bottomRight: Radius.circular(20)),
      ),
      child: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: ((OverscrollIndicatorNotification? notificaton) {
              notificaton!.disallowIndicator();
              return true;
            }),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                drawerListTile(
                    icon: favorite_selected_icon,
                    txt: favourites_txt,
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => favouritesPage()));

                    }),
                drawerListTile(
                    icon: privacy_icon, txt: privacy_txt, onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => privacyPage()));

                }),
                drawerListTile(icon: terms_icon, txt: terms_txt, onTap: () {

                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => termsPage()));
                }),
              ],
            )),
      ),
    );
  }
}
