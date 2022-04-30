import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MangaPageController extends GetxController {
  late ScrollController _scrollController;

  @override
  void onInit() {
    _scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    _scrollController.dispose();
    super.onClose();
  }
}
