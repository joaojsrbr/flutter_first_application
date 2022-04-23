// ignore_for_file: non_constant_identifier_names, avoid_print

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/manga/animated_detail_header_gridview.dart';
import 'package:void_01/src/env/models/manga/config/config.dart';
import 'package:void_01/src/env/models/manga/grid_build_widget.dart';
import 'package:void_01/src/env/models/manga/widget/navbar_scroll_to_hide_widget.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/manga/widget/sliverheader/SliverHeader_env.dart';
import '../blocs/Item_events.dart';
import '../blocs/Item_state.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  late final ItemBloc bloc;
  late ScrollController _scrollController;
  final _controllerdrag = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    bloc = ItemBloc();
    bloc.add(LoadItemEvent());
    _controllerdrag.addListener(rebuild);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    bloc.close();
    _controllerdrag.removeListener(rebuild);
    super.dispose();
  }

  void onPressed(Selectedindex) {
    setState(
      () {
        Selectedindex.forEach((element) {
          bloc.add(
            RemoveItemEvent(
              key: element,
            ),
          );
        });
        _controllerdrag.clear();
      },
    );
  }

  void rebuild() => setState(() {});

  int indexscreen = 0;
  @override
  Widget build(BuildContext context) {
    final screen = [
      BlocBuilder<ItemBloc, ItemState>(
        bloc: bloc,
        builder: (context, state) {
          final itens = state.itens;
          if (state is ItemInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ItemSuccessState) {
            return MainListaManga(
              context: context,
              itens: itens,
            );
          }
          return Container();
        },
      ),
      const ConfigPage(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: screen[indexscreen],
      bottomNavigationBar: ScrollToHideWidgetState(
        controller: _scrollController,
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            selectedIndex: indexscreen,
            onDestinationSelected: (index) =>
                setState(() => indexscreen = index),
            height: 60,
            backgroundColor: Theme.of(context).colorScheme.onSecondary,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.book_rounded,
                ),
                label: "Manga",
                icon: Icon(
                  Icons.book_outlined,
                ),
              ),
              NavigationDestination(
                selectedIcon: Icon(
                  Icons.settings,
                ),
                label: "Config",
                icon: Icon(
                  Icons.settings_outlined,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MainListaManga({required itens, required context}) {
    final isSelected = _controllerdrag.value.isSelecting;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPersistentHeader(
            floating: true,
            delegate: SliverHeader_env(
              // maxExtend: MediaQuery.of(context).size.height,
              maxExtend: 110,
              mixExtend: 90,
              builder: (percent) {
                return AnimatedDetailGridView(
                  title: "Homepage",
                  controllerdrag: _controllerdrag,
                  scrollController: _scrollController,
                  itens: itens,
                  isSelected: isSelected,
                  percent: percent,
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: gridbuild(
                itens: itens,
                controllerdrag: _controllerdrag,
                scrollController: _scrollController),
          )
        ],
      ),
      floatingActionButton: (isSelected)
          ? FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                final Selectedindex = _controllerdrag.value.selectedIndexes
                    .map<dynamic>((index) => itens[index].key);
                print(Selectedindex);
                onPressed(Selectedindex);
              },
              child: const Icon(Icons.done),
            )
          : Container(),
    );
  }
}
