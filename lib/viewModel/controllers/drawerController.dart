import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class drawerController extends GetxController {

  var drawerController_key = GlobalKey<ScaffoldState>();
  RxMap pref_info = RxMap();


  void openDrawer() {
    drawerController_key.currentState!.openDrawer();
  }

  void closeDrawer() {
    drawerController_key.currentState!.openEndDrawer();
  }
}
