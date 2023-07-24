import 'package:bangladesh_news/utils/constants/colors.dart';
import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/lists/topTabLists.dart';
import 'package:bangladesh_news/view/homePage.dart';
import 'package:bangladesh_news/viewModel/appRouter.dart';
import 'package:bangladesh_news/viewModel/controllers/drawerController.dart';
import 'package:bangladesh_news/viewModel/controllers/favouriteController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      statusBarBrightness: Brightness.dark,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('myBox');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final drawer_controller = Get.put(drawerController());
  final favourite_controller = Get.put(favouriteController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: app_name_txt,
      debugShowCheckedModeBanner: false,
      home: homePage(),
      theme: ThemeData(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(systemOverlayStyle: SystemUiOverlayStyle.dark),
        colorScheme: ColorScheme.fromSeed(seedColor: blueGreyColor),
      ),
      /*routeInformationParser: appRouter().router.routeInformationParser,
      routeInformationProvider: appRouter().router.routeInformationProvider,
      routerDelegate: appRouter().router.routerDelegate,*/
    );
  }
}

