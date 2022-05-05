import 'dart:math';

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:void_01/src/env/models/item/adapters/item.dart';
import 'package:void_01/src/env/models/item/hive_config.dart';
import 'package:void_01/src/env/models/item/repository.dart';

class Homepage2Controller extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxList selecionadas = [].obs;

  late TabController tabController;

  // void resetForm() {
  //   key.currentState.reset();
  //   controllerdrag.text = '';
  //   focusNode.requestFocus();
  // }

  late Box<Item> favoritebox;

  // sreen index
  RxInt indexscreen = 0.obs;

  // Scroll Controller
  late ScrollController scrollController;

  // Select Controller
  final controllerdrag = DragSelectGridViewController();

  @override
  void onInit() {
    favoritebox = Hive.box(favoritesBox);
    controllerdrag.addListener(rebuild);
    scrollController = ScrollController()..addListener(() => update());

    // if (Get.routing.current == "/home") {
    //   controllerdrag.dispose();
    // }
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );

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
    tabController.dispose();
    scrollController.dispose();
    controllerdrag.removeListener(rebuild);

    super.onClose();
  }

//   void drag(){
//     if (AppLifecycleState state){
// controllerdrag.dispose();
//     }
//   }

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
  }

  void onremovePressed(List<Item> itens, Itemrepository state) {
    final key = controllerdrag.value.selectedIndexes
        .map<dynamic>((index) => itens[index].key)
        .toList();
    for (var element in key) {
      state.removeItem(element);
    }
  }

  String randomName() {
    final rand = Random();
    return ['¯\\_(ツ)_/¯', '乁( ⁰͡ Ĺ̯ ⁰͡ ) ㄏ', ':\')'].elementAt(rand.nextInt(3));
  }
}
