import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class AnimatedDetailController extends GetxController
    with GetTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void onInit() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 134));
    super.onInit();
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}
