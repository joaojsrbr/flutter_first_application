import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritePageController());
    Get.lazyPut(() => Homepage2Controller());
  }
}
