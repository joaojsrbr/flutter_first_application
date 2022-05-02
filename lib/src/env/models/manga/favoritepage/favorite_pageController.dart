// ignore_for_file: file_names

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:void_01/main.dart';
import 'package:void_01/src/env/models/item/adapters/item.dart';

class FavoritePageController extends GetxController {
  final controllerdragfavorite = DragSelectGridViewController();
  @override
  void onInit() {
    favoritebox = Hive.box(favoritesBox);
    controllerdragfavorite.addListener(update);
    super.onInit();
  }

  @override
  void onClose() {
    controllerdragfavorite.removeListener(update);
    super.onClose();
  }

  late Box<Item> favoritebox;

  void onremovePresed(value) {
    value.forEach((element) {
      favoritebox.delete(element.title);
    });
  }
}
