

import 'package:bangladesh_news/utils/lists/newsSiteList.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class favouriteController extends GetxController{
  var box = Hive.box('myBox');

  RxList newNewsSiteList=[].obs;

  @override
  void onInit() async{
    newNewsSiteList.value=box.get("favKey")==null?[]: await box.get("favKey");
    if(newNewsSiteList.isEmpty){
      newNewsSiteList.value=await newsSiteList;
      await box.put("favKey",newsSiteList);
    }
    super.onInit();
  }


  favourite(String title){
    for (int i = 0; i < newNewsSiteList.length; i++) {
      if (newNewsSiteList[i]["title"] == title) {
        newNewsSiteList[i]['favourite'] = !newNewsSiteList[i]['favourite'];
      }
    }
    box.put("favKey",newNewsSiteList);
  }


}