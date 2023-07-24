import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:bangladesh_news/utils/constants/image_paths.dart';
import 'package:bangladesh_news/utils/constants/strings.dart';
import 'package:bangladesh_news/utils/decorations/conponants/appBarWithBackButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class privacyPage extends StatelessWidget {
  privacyPage({Key? key}) : super(key: key);

  RxString fileContent = ''.obs;

  @override
  Widget build(BuildContext context) {
    readPrivacy();
    return Scaffold(
      appBar: appBarWithBackButton(privacy_txt, context),
      body: SafeArea(
        child: Obx(() => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [Text(fileContent.value), 30.heightBox],
              ).marginOnly(left: 10, right: 10),
            )),
      ),
    );
  }

  readPrivacy() async {
    fileContent.value = await rootBundle.loadString(privacy_file);
    /*final file=File(privacy_file);
    fileContent.value=await file.readAsString();*/
  }
}
