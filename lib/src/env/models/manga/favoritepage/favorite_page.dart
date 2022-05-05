import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:void_01/src/env/models/item/adapters/item.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_sliver_person.dart';

class FavoritePage extends GetResponsiveWidget<FavoritePageController> {
  final GetxController? favoritepageController;
  FavoritePage({
    this.favoritepageController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.synchronized(
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 100),
        child: FadeInAnimation(
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            body: ValueListenableBuilder(
              valueListenable: controller.favoritebox.listenable(),
              builder: (ctx, Box<Item> box, _) {
                return CustomSliverPerson<FavoritePageController>(
                  tabController: controller.tabController,
                  key: const Key('SliverfavPage'),
                  controllerdrag: controller.controllerdragfavorite,
                  scrollController: controller.scrollController,
                  isNotEmpty: box.isNotEmpty,
                  maxExtend: 60,
                  mixExtend: 50,
                  title: "Favorito",
                  pinned: true,
                  floating: true,
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.primary),
                  homepage: false,
                  itens: box.values.toList(),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  tabs: [
                    Tab(
                      child: Text(
                        "asdasd",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "asdasd",
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.outline),
                      ),
                    ),
                  ],
                  actions: [
                    IconButton(
                      key: const Key('onHiveremovePresed'),
                      color: Theme.of(context).colorScheme.secondary,
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        final _keys = controller
                            .controllerdragfavorite.value.selectedIndexes
                            .map<Item>((index) => box.values.toList()[index])
                            .toList();
                        controller.onremovePresed(_keys);
                        controller.controllerdragfavorite.clear();
                      },
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
