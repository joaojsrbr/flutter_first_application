import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/blocs/item_events.dart';

class Homepage2Controller extends GetxController {
  RxList selecionadas = [].obs;
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
}
