import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollToHideWidgetStateController extends GetxController {
  final ScrollController scrollcontroller;
  ScrollToHideWidgetStateController({required this.scrollcontroller});
  // ScrollToHideWidgetStateController({required this.controller});

  bool isVisible = true;
  @override
  void onInit() {
    scrollcontroller.addListener(listen);
    super.onInit();
  }

  @override
  void dispose() {
    scrollcontroller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    if (scrollcontroller.position.pixels >= 200) {
      hide();
    } else {
      show();
    }
  }

  void show() {
    if (!isVisible) {
      isVisible = true;
    }
  }

  void hide() {
    if (isVisible) {
      isVisible = false;
    }
  }
}
