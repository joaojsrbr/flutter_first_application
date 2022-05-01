import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:get/get.dart';
import 'package:void_01/src/env/models/item/repository.dart';

import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_sliver_person.dart';

class FavoritePageController extends GetxController {
  final Homepage2Controller _c = Get.put(Homepage2Controller());
  // void onremovePresed(value) {
  //   final _keys = _c.controllerdrag.value.selectedIndexes
  //       .map<Item>((index) => value.lista[index])
  //       .toList();
  //   _keys.forEach((element) {
  //     box.delete(element.title);
  //   });
  //   _c.controllerdrag.clear();
  // }
}

class FavoritePage extends GetView<FavoritePageController> {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoritePageController());
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<Itemrepository>(
        builder: (ctx, state, _) {
          final itens = state.lista;
          return CustomSliverPerson2(
            itens: itens,
            onaddPressed: () {},
            // onremovePresed: () => controller.onremovePresed(itens),
            onremovePresed: () {},
            title: "Favorito",
          );
        },
      ),
    );
  }
}
