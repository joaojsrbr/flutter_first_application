import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';

import '../grid_build/gridbuild_widget.dart';

class CustomSliverPerson2Controller extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController scrollController;

  @override
  void onInit() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    scrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    _tabController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}

class CustomSliverPerson2 extends GetView<CustomSliverPerson2Controller> {
  final dynamic itens;
  final double maxExtend;
  final double mixExtend;
  final VoidCallback? onaddPressed;
  final VoidCallback? onremovePresed;
  final bool floating;
  final bool pinned;
  final String title;
  final bool homepage;
  final ScrollPhysics physics;
  final bool isNotEmpty;
  final VoidCallback? onPressed;
  const CustomSliverPerson2({
    Key? key,
    required this.homepage,
    this.onPressed,
    required this.itens,
    this.title = '',
    required this.isNotEmpty,
    this.physics = const BouncingScrollPhysics(),
    this.floating = false,
    this.pinned = false,
    this.maxExtend = 110.0,
    this.mixExtend = 90.0,
    this.onaddPressed,
    this.onremovePresed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String randomName() {
      final rand = Random();
      return ['¯\\_(ツ)_/¯', '乁( ⁰͡ Ĺ̯ ⁰͡ ) ㄏ', ':\')']
          .elementAt(rand.nextInt(3));
    }

    final Homepage2Controller _c = Get.find();
    final FavoritePageController _d = Get.find();
    final _e = Get.put(CustomSliverPerson2Controller());

    return homepage
        ? GetBuilder<Homepage2Controller>(
            builder: (controller) => NestedScrollView(
              physics: physics,
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _e._tabController,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Gridbuild(
                      homepage: homepage,
                      controllers: _c.controllerdrag,
                      itens: itens,
                    ),
                  ),
                  Center(
                    child: Text(
                      randomName(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              floatHeaderSlivers: true,
              key: const Key('isEmpty'),
              controller: _c.scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                controller.controllerdrag.value.isSelecting
                    ? SliverAppBar(
                        titleSpacing: 0,
                        leading: const CloseButton(),
                        actions: [
                          IconButton(
                            color: Theme.of(context).colorScheme.secondary,
                            onPressed: onaddPressed,
                            icon: const Icon(Icons.add),
                          ),
                          IconButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: const Icon(Icons.delete_outline),
                            onPressed: onremovePresed,
                          )
                        ],
                        title: Text(
                          '${controller.controllerdrag.value.amount}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        elevation: 0,
                        toolbarHeight: 70,
                        floating: false,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        snap: false,
                        pinned: true,
                        bottom: TabBar(
                          controller: _e._tabController,
                          tabs: [
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SliverAppBar(
                        leading: Container(),
                        leadingWidth: 0,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        title: Text(
                          title,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        elevation: 0,
                        toolbarHeight: 70,
                        floating: true,
                        snap: false,
                        pinned: true,
                        bottom: TabBar(
                          controller: _e._tabController,
                          tabs: [
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                          ],
                        ),
                      )

                // ),
              ],
            ),
          )
        : GetBuilder<FavoritePageController>(
            builder: (controller) => NestedScrollView(
              physics: physics,
              body: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _e._tabController,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Gridbuild(
                      homepage: homepage,
                      controllers: _d.controllerdragfavorite,
                      itens: itens,
                    ),
                  ),
                  Center(
                    child: Text(
                      randomName(),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              floatHeaderSlivers: true,
              key: const Key('isEmpty'),
              controller: _c.scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                controller.controllerdragfavorite.value.isSelecting
                    ? SliverAppBar(
                        titleSpacing: 0,
                        leading: const CloseButton(),
                        actions: [
                          IconButton(
                            color: Theme.of(context).colorScheme.secondary,
                            icon: const Icon(Icons.delete_outline),
                            onPressed: onremovePresed,
                          )
                        ],
                        title: Text(
                          '${controller.controllerdragfavorite.value.amount}',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        elevation: 0,
                        toolbarHeight: 70,
                        floating: false,
                        snap: false,
                        pinned: true,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        bottom: TabBar(
                          controller: _e._tabController,
                          tabs: [
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                          ],
                        ),
                      )
                    : SliverAppBar(
                        leading: Container(),
                        leadingWidth: 0,
                        backgroundColor:
                            Theme.of(context).colorScheme.background,
                        title: Text(
                          title,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                        elevation: 0,
                        toolbarHeight: 70,
                        floating: true,
                        snap: false,
                        pinned: true,
                        bottom: TabBar(
                          controller: _e._tabController,
                          tabs: [
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "asdasd",
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.outline),
                              ),
                            ),
                          ],
                        ),
                      )

                // ),
              ],
            ),
          );
  }
}
