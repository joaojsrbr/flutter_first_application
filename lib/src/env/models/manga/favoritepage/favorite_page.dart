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
          return CustomSliverPerson2(
            isNotEmpty: box.values.isNotEmpty,
            homepage: false,
            itens: box.values.toList(),
            onaddPressed: () {},
            onremovePresed: () {
              final _keys = controller
                  .controllerdragfavorite.value.selectedIndexes
                  .map<Item>((index) => box.values.toList()[index])
                  .toList();
              controller.onremovePresed(_keys);
              controller.controllerdragfavorite.clear();
            },
            title: "Favorito",
          );

          // return CustomSliverPerson2(
          //   isNotEmpty: box.values.isNotEmpty,
          //   homepage: false,
          //   itens: itens,
          //   onaddPressed: () {},
          //   onremovePresed: () {},
          //   title: "Favorito",
          // );
        },
      ),
    );
  }
}
