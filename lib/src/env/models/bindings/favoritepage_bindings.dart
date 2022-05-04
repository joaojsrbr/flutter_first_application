import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';

class FavoritePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoritePageController());
  }
}
