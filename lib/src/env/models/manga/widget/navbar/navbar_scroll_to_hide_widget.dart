import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';
import 'package:void_01/src/env/models/manga/widget/navbar/navbar_controller.dart';

class ScrollToHideWidgetState
    extends GetView<ScrollToHideWidgetStateController> {
  final Widget child;
  final Duration duration;
  final double height;

  const ScrollToHideWidgetState(
      {Key? key,
      required this.child,
      this.duration = const Duration(milliseconds: 200),
      this.height = kBottomNavigationBarHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Homepage2Controller c = Get.find();
    // Get.put(Homepage2Controller());
    Get.put(ScrollToHideWidgetStateController(
        scrollcontroller: c.scrollController));
    return Obx(
      () => AnimatedContainer(
        duration: duration,
        height: controller.isVisible.value ? height : 0,
        child: Wrap(
          children: [child],
        ),
      ),
    );
  }
}
