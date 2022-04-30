import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_sliver_person.dart';

import '../blocs/item_state.dart';

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
      body: BlocBuilder<ItemBloc, ItemState>(
        bloc: _c.bloc,
        builder: (context, state) {
          final itens = state.itens2;

          return CustomSliverPerson2(
            itens: itens,
            onaddPressed: () {},
            onremovePresed: () {},
            title: "Favorito",
          );
        },
      ),
    );
  }
}
