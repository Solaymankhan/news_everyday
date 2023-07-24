import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/constants/image_paths.dart';
import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/buttonsDecoration/roundedSmallIconButton.dart';
import 'package:bangladesh_news/utils/decorations/textDecorations/topTabTextDecorations.dart';
import 'package:bangladesh_news/utils/lists/topTabLists.dart';
import 'package:bangladesh_news/view/drawersAndAlertDialogues/drawerSlider.dart';
import 'package:bangladesh_news/view/drawersAndAlertDialogues/showCancelAppAlertDialog.dart';
import 'package:bangladesh_news/view/searchPage.dart';
import 'package:bangladesh_news/viewModel/controllers/drawerController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:upgrader/upgrader.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> with TickerProviderStateMixin {

  final drawerController drawer_controller = Get.find();

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: topTabTextsList.length, vsync: this);
    return WillPopScope(
      onWillPop: () async {
        return await showCancelAppAlertDialog(context) ?? false;
      },
      child: Scaffold(
        drawerEnableOpenDragGesture: false,
        key: drawer_controller.drawerController_key,
        drawer:  GetBuilder<drawerController>(builder: (controller) { return drawerSlider();}),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
              Image.asset(
                app_icon_img,
                height: 30,
                width: 30,
              ),
              SizedBox(width: 10,),
              Expanded(child: topTabTextDecorations(txt: app_name_txt))
            ],
          ),
          actions: [
            roundedSmallIconButton(
                icon: CupertinoIcons.search,
                icon_clr: redColor,
                btn_clr: yellowGreyColor,
                onTap: (){

                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          fullscreenDialog: true,
                          builder: (context) => searchPage()));

                }).marginAll(8),
            roundedSmallIconButton(
                icon: Icons.menu,
                icon_clr: blueGreyColor,
                btn_clr: yellowGreyColor,
                onTap: (){
                  drawer_controller.openDrawer();
            }).marginAll(8),

            SizedBox(width: 5,),
          ],
        ),
        body:  UpgradeAlert(
          child: SafeArea(
            child: Column(
              children: [
                TabBar(
                  controller:tabController,
                  isScrollable: true,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 0.5, color: greyColor),
                    color: Colors.yellow,
                  ),
                  indicatorPadding: EdgeInsets.all(8),
                  tabs: topTabTextsList,
                ),
                Expanded(
                  child: TabBarView(
                    physics: BouncingScrollPhysics(),
                    controller: tabController,
                    children:  topTabPagesList,
                  ).paddingOnly(left: 5,right: 5),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
