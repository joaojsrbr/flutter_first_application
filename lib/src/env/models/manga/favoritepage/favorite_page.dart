import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:void_01/src/env/models/item/adapters/item.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_sliver_person.dart';

class FavoritePage extends GetResponsiveView<FavoritePageController> {
  FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritePageController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ValueListenableBuilder(
        valueListenable: controller.favoritebox.listenable(),
        builder: (ctx, Box<Item> box, _) {
          final itens = box.values.toList();

          return CustomSliverPerson2(
            homepage: false,
            itens: itens,
            onaddPressed: () {},
            onremovePresed: () {
              final _keys = controller
                  .controllerdragfavorite.value.selectedIndexes
                  .map<Item>((index) => itens[index])
                  .toList();
              controller.onremovePresed(_keys);
              controller.controllerdragfavorite.clear();
            },
            title: "Favorito",
          );
        },
      ),
    );
  }
}
