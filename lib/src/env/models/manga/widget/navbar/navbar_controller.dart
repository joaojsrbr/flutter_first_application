import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollToHideWidgetStateController extends GetxController {
  final ScrollController scrollcontrollerhome;
  final ScrollController scrollcontrollerfav;
  ScrollToHideWidgetStateController(
      {required this.scrollcontrollerhome, required this.scrollcontrollerfav});
  // ScrollToHideWidgetStateController({required this.controller});

  RxBool isVisible = true.obs;
  @override
  void onInit() {
    scrollcontrollerhome.addListener(listen);
    scrollcontrollerfav.addListener(listen2);
    super.onInit();
  }

  @override
  void dispose() {
    scrollcontrollerhome.removeListener(listen);
    scrollcontrollerfav.removeListener(listen2);
    super.dispose();
  }

  void listen() {
    if (scrollcontrollerhome.position.pixels >= 68) {
      hide();
    } else {
      show();
    }
  }

  void listen2() {
    if (scrollcontrollerfav.position.pixels >= 68) {
      hide();
    } else {
      show();
    }
  }

  // void listen() {
  //   final direction = widget.controller.position.userScrollDirection;
  //   if (direction == ScrollDirection.forward) {
  //     show();
  //   } else if (direction == ScrollDirection.reverse) {
  //     hide();
  //   }
  // }

  void show() {
    if (!isVisible.value) {
      isVisible.value = true;
      update();
    }
  }

  void hide() {
    if (isVisible.value) {
      isVisible.value = false;
      update();
    }
  }
}
