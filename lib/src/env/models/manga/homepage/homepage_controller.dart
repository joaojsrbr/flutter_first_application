import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:void_01/main.dart';

import 'package:void_01/src/env/models/item/adapters/item.dart';
import 'package:void_01/src/env/models/item/repository.dart';

class Homepage2Controller extends GetxController {
  RxList selecionadas = [].obs;

  final controllerdrag = DragSelectGridViewController();

  late Box<Item> favoritebox;

  // sreen index
  RxInt indexscreen = 0.obs;
  // Bloc

  // Scroll Controller
  late ScrollController scrollController;
  // Select Controller

  @override
  void onInit() {
    favoritebox = Hive.box(favoritesBox);
    controllerdrag.addListener(rebuild);
    scrollController = ScrollController();

    super.onInit();
  }

  downloadCondition(value) {
    indexscreen.value = value;
  }

  void rebuild() {
    update();
  }

  @override
  void onClose() {
    scrollController.dispose();

    controllerdrag.removeListener(rebuild);
    super.onClose();
  }

  void addonPressed(itens) {
    final _keys = controllerdrag.value.selectedIndexes
        .map<Item>((index) => itens![index])
        .toList();

    for (var element in _keys) {
      favoritebox.put(
        element.title,
        Item(
            descr: element.descr,
            icon: element.icon,
            key: element.key,
            title: element.title,
            urlfoto: element.urlfoto),
      );
    }
    controllerdrag.clear();
  }

  void onremovePressed(itens, Itemrepository state) {
    final key = controllerdrag.value.selectedIndexes
        .map<dynamic>((index) => itens![index].key);
    for (var element in key) {
      state.removeItem(element);
    }
  }
}
