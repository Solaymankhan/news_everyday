import 'package:bangladesh_news/utils/lists/newsSiteList.dart';
import 'package:bangladesh_news/viewModel/controllers/favouriteController.dart';
import 'package:get/get.dart';

class searchController extends GetxController {
  RxList search_newsList = [].obs;
  final favouriteController favourite_controller = Get.find();

  @override
  void onInit() {
    search_newsList.value = favourite_controller.newNewsSiteList;
    super.onInit();
  }

  searchPaper(String str) async{
    search_newsList.value=[];
    for (var element in favourite_controller.newNewsSiteList) {
      if (element['title'].toString().toLowerCase().contains(str.toLowerCase())) {
        search_newsList.add(element);
      }
    }
  }
}
