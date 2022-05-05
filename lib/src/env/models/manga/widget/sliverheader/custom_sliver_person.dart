import 'dart:math';

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../grid_build/gridbuild_widget.dart';

class CustomSliverPerson2Controller extends GetxController {
  String randomName() {
    final rand = Random();
    return [
      '¯\\_(ツ)_/¯',
      //  '乁( ⁰͡ Ĺ̯ ⁰͡ ) ㄏ', ':\')'
    ].elementAt(rand.nextInt(1));
  }
}

class CustomSliverPerson<T extends GetxController> extends StatelessWidget
    implements PreferredSizeWidget {
  final bool isNotEmpty;
  final List itens;
  final double maxExtend;
  final double mixExtend;
  // final VoidCallback? onaddPressed;
  // final VoidCallback? onremovePresed;
  final bool homepage;
  final TabController tabController;
  final ScrollPhysics physics;
  final DragSelectGridViewController controllerdrag;
  final T? init;
  final String title;
  final TextStyle? style;
  // final TextStyle styletab;
  final Color? backgroundColor;
  final double toolbarHeight;
  final bool pinned;
  final bool floating;
  final bool snap;
  final List<Widget> tabs;
  final double titleSpacing;
  final List<Widget>? actions;
  final ScrollController scrollController;
  const CustomSliverPerson({
    required this.tabController,
    required this.isNotEmpty,
    required this.itens,
    required this.homepage,
    required this.controllerdrag,
    required this.tabs,
    required this.scrollController,
    this.titleSpacing = 0.0,
    this.toolbarHeight = 70.0,
    this.pinned = true,
    this.floating = false,
    this.snap = false,
    this.backgroundColor,
    this.actions,
    this.init,
    this.title = '',
    // this.styletab = const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
    this.style,
    this.maxExtend = 110.0,
    this.mixExtend = 90.0,
    this.physics = const BouncingScrollPhysics(),
    // this.onaddPressed,
    // this.onremovePresed,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('asdasd');
    }
    // final _e = Get.put(CustomSliverPerson2Controller());
    final _ = Get.put(CustomSliverPerson2Controller());
    return GetBuilder<T>(
      init: init,
      builder: (controllermain) => NestedScrollView(
        controller: scrollController,
        physics: physics,
        body: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: [
            isNotEmpty
                ? Gridbuild<T>(
                    controllerdrag: controllerdrag,
                    itens: itens,
                  )
                : Center(
                    child: Text(
                      _.randomName(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
            Center(
              child: Text(
                _.randomName(),
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAnimatedSwitcher(
              duration: kThemeAnimationDuration,
              child: homepage
                  ? SliverAppBar(
                      actions: controllerdrag.value.isSelecting
                          ? actions
                          : <Widget>[],
                      leading: controllerdrag.value.isSelecting
                          ? const CloseButton()
                          : const SizedBox(
                              width: 0,
                              height: 0,
                            ),
                      leadingWidth: controllerdrag.value.isSelecting
                          ? 56.0
                          : NavigationToolbar.kMiddleSpacing,
                      title: Text(
                        controllerdrag.value.isSelecting
                            ? '${controllerdrag.value.amount}'
                            : title,
                        style: controllerdrag.value.isSelecting
                            ? TextStyle(
                                color: Theme.of(context).colorScheme.primary)
                            : style,
                      ),
                      backgroundColor: backgroundColor,
                      toolbarHeight: toolbarHeight,
                      pinned: pinned,
                      floating:
                          controllerdrag.value.isSelecting ? false : floating,
                      titleSpacing: titleSpacing,
                      snap: snap,
                      bottom: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        controller: tabController,
                        tabs: tabs,
                      ),
                    )
                  : SliverAppBar(
                      actions: controllerdrag.value.isSelecting
                          ? actions
                          : <Widget>[],
                      leading: controllerdrag.value.isSelecting
                          ? const CloseButton()
                          : const SizedBox(
                              width: 0,
                              height: 0,
                            ),
                      leadingWidth: controllerdrag.value.isSelecting
                          ? 56.0
                          : NavigationToolbar.kMiddleSpacing,
                      title: Text(
                        controllerdrag.value.isSelecting
                            ? '${controllerdrag.value.amount}'
                            : title,
                        style: controllerdrag.value.isSelecting
                            ? TextStyle(
                                color: Theme.of(context).colorScheme.primary)
                            : style,
                      ),
                      backgroundColor: backgroundColor,
                      toolbarHeight: toolbarHeight,
                      titleSpacing: titleSpacing,
                      pinned: pinned,
                      floating: floating,
                      snap: snap,
                      bottom: TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Theme.of(context).colorScheme.primary,
                        controller: tabController,
                        tabs: tabs,
                      ),
                    ),
            )
          ];
        },
      ),
    );
  }
}
