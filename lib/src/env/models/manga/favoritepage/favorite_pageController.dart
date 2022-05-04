// ignore_for_file: file_names

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:void_01/main.dart';
import 'package:void_01/src/env/models/item/adapters/item.dart';

class FavoritePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final controllerdragfavorite = DragSelectGridViewController();
  late TabController tabController;
  @override
  void onInit() {
    favoritebox = Hive.box(favoritesBox);
    controllerdragfavorite.addListener(update);
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.onInit();
  }

  @override
  void onClose() {
    controllerdragfavorite.removeListener(update);
    tabController.dispose();
    super.onClose();
  }

  late Box<Item> favoritebox;

  void onremovePresed(value) {
    value.forEach((element) {
      favoritebox.delete(element.title);
    });
  }
}
