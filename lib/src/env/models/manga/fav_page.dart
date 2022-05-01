import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/item/item.dart';

import 'package:void_01/src/env/models/item/repository.dart';

import 'package:get/get.dart';

import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_sliver_person.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final Homepage2Controller _c = Get.find();
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<Itemrepository>(builder: (context, value, child) {
        // print(box.keys);
        print(value.lista);
        final _keys = _c.controllerdrag.value.selectedIndexes
            .map<Item>((index) => value.lista[index]);

        print(_keys);
        return CustomSliverPerson2(
          itens: value.lista,
          onaddPressed: () {},
          onremovePresed: () {
            value.removebox(_keys);
          },
          title: "Favorito",
        );
      }),
    );
  }
}
