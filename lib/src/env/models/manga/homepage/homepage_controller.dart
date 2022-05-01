import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/blocs/item_events.dart';
import 'package:void_01/src/env/models/item/adapters/item.dart';

class Homepage2Controller extends GetxController {
  RxList selecionadas = [].obs;
  late Box<Item> favoriteBox;
  // sreen index
  RxInt indexscreen = 0.obs;
  // Bloc
  late final ItemBloc bloc;
  // Scroll Controller
  late ScrollController scrollController;
  // Select Controller
  final controllerdrag = DragSelectGridViewController();

  @override
  void onInit() {
    bloc = ItemBloc();
    bloc.add(LoadItemEvent());
    controllerdrag.addListener(rebuild);
    scrollController = ScrollController();
    favoriteBox = Hive.box('favorite_books');
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
    bloc.close();
    scrollController.dispose();
    controllerdrag.removeListener(rebuild);
    super.onClose();
  }

  void addonPressed(itens) {
    final _keys = controllerdrag.value.selectedIndexes
        .map<Item>((index) => itens![index])
        .toList();

    bloc.add(AddItemEvent(key: _keys));
    // _keys.forEach(
    //   (element) {
    //     favoriteBox.put(
    //       element.title,
    //       Item(
    //           descr: element.descr,
    //           icon: element.icon,
    //           key: element.key,
    //           title: element.title,
    //           urlfoto: element.urlfoto),
    //     );
    //     controllerdrag.clear();
    //   },
    // );
    // controllerdrag.clear();
  }

  void onremovePressed(itens) {
    final key = controllerdrag.value.selectedIndexes
        .map<dynamic>((index) => itens![index].key);
    key.forEach(
      (element) {
        bloc.add(
          RemoveItemEvent(
            key: element,
          ),
        );
      },
    );
    controllerdrag.clear();
  }
}
