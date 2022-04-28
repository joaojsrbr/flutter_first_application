import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_Sliver_Person.dart';

import '../item/favorepository.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late ScrollController _scrollController;

  // Select Controller
  final _controllerdrag = DragSelectGridViewController();

  void rebuild() => setState(() {});

  @override
  void initState() {
    _controllerdrag.addListener(rebuild);
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controllerdrag.removeListener(rebuild);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Consumer<Favrepository>(builder: (context, value, child) {
        final itens = value.itens2;
        print(itens);
        return CustomSliverPerson(
          itens: itens,
          onaddPressed: () {},
          onremovePresed: () {},
          title: "Favorito",
          scrollController: _scrollController,
          controllerdrag: _controllerdrag,
        );
      }),
    );
  }
}
