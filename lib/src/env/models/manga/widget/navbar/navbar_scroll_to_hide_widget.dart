import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';
import 'package:void_01/src/env/models/manga/widget/navbar/navbar_controller.dart';

class ScrollToHideWidgetState
    extends GetResponsiveView<ScrollToHideWidgetStateController> {
  final Widget child;
  final Duration duration;
  final double height;
  final ScrollController scrollcontroller;
  ScrollToHideWidgetState(
      {Key? key,
      required this.scrollcontroller,
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
    return AnimatedContainer(
      duration: duration,
      height: controller.isVisible ? height : 0,
      child: Wrap(
        children: [child],
      ),
    );
  }
}
