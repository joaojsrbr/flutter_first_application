import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';
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
    final Homepage2Controller _m = Get.find();
    final FavoritePageController _f = Get.find();
    Get.put(ScrollToHideWidgetStateController(
        scrollcontrollerfav: _f.scrollController,
        scrollcontrollerhome: _m.scrollController));
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
