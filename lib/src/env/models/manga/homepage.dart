// ignore_for_file: non_constant_identifier_names

import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';

import 'package:void_01/src/env/models/manga/config.dart';
import 'package:animations/animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:void_01/src/env/models/manga/mangapage.dart';
import 'package:void_01/src/env/models/manga/widget/appbar_scroll_to_hide.dart';
import 'package:void_01/src/env/models/manga/widget/navbar_scroll_to_hide_widget.dart';
import 'package:void_01/src/env/models/manga/widget/selected_item_widget.dart';

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
  final controllerdrag = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    bloc = ItemBloc();
    bloc.add(LoadItemEvent());
    controllerdrag.addListener(rebuild);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    bloc.close();
    controllerdrag.removeListener(rebuild);
    super.dispose();
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
              itens: itens,
            );
          }
          return Container();
        },
      ),
      const ConfigPage(),
    ];

    return Scaffold(
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
            backgroundColor: Colors.transparent,
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

  Widget MainListaManga({
    required itens,
  }) {
    final isSelected = controllerdrag.value.isSelecting;
    return Scaffold(
      body: _gridbuild(itens: itens),
      appBar: AppBarToHide(
        selection: controllerdrag.value,
        height: 80,
        position: 100,
        duration: const Duration(milliseconds: 250),
        elevate: 0.0,
        color: Colors.transparent,
        controller: _scrollController,
      ),
      floatingActionButton: (isSelected)
          ? FloatingActionButton(
              onPressed: () {
                onPressed(itens);
              },
              child: const Icon(Icons.done),
            )
          : Container(),
    );
  }

  void onPressed(dynamic itens) {
    setState(
      () {
        final Selectedindex = controllerdrag.value.selectedIndexes
            .map<dynamic>((index) => itens[index].key);
        print(Selectedindex);
        Selectedindex.forEach(
          (element) => bloc.add(
            RemoveItemEvent(
              key: itens[element],
            ),
          ),
        );
        controllerdrag.clear();
        controllerdrag.clear();
      },
    );
  }

  Widget _gridbuild({itens}) {
    // int selectedCard = -1;
    return DragSelectGridView(
      shrinkWrap: true,
      primary: false,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
      ),
      physics: const BouncingScrollPhysics(),
      itemCount: itens.length,
      scrollController: _scrollController,
      gridController: controllerdrag,
      itemBuilder: (BuildContext ctxt, index, selected) {
        return AnimationConfiguration.staggeredGrid(
          columnCount: itens.length,
          position: index,
          child: ScaleAnimation(
            duration: const Duration(milliseconds: 500),
            child: FadeInAnimation(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 4, left: 5, right: 4, bottom: 8),
                child: OpenContainer(
                  openColor: Colors.transparent,
                  closedElevation: 0,
                  openElevation: 0,
                  closedColor: Colors.transparent,
                  openShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  closedShape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  transitionType: ContainerTransitionType.fade,
                  transitionDuration: const Duration(milliseconds: 670),
                  openBuilder: (context, _) => MangaPage(
                      title: itens[index].title,
                      image: itens[index].urlfoto,
                      desc: itens[index].descr),
                  closedBuilder: (context, VoidCallback openContainer) =>
                      GestureDetector(
                    onTap: openContainer,
                    child: SelectView(
                      itens: itens,
                      index: index,
                      isSelected: selected,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
