import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/blocs/Item_events.dart';
import 'package:void_01/src/env/models/blocs/Item_state.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/manga/config.dart';
import 'package:animations/animations.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:void_01/src/env/models/manga/mangapage.dart';
import 'package:void_01/src/env/models/manga/widget/selectable_item_widget.dart';
import 'package:void_01/src/env/models/manga/widget/appbar_scroll_to_hide.dart';
import 'package:void_01/src/env/models/manga/widget/disable_indicator.dart';
import 'package:void_01/src/env/models/manga/widget/navbar_scroll_to_hide_widget.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  final controllerdrag = DragSelectGridViewController();
  late ScrollController _scrollController;
  late final ItemBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ItemBloc();
    controllerdrag.addListener(rebuild);
    bloc.add(LoadItemEvent());
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    controllerdrag.removeListener(rebuild);
    bloc.close();
    super.dispose();
  }

  void rebuild() => setState(() {});

  int indexscreen = 0;
  @override
  Widget build(BuildContext context) {
    final isSelected = controllerdrag.value.isSelecting;
    final textapp = isSelected
        ? Text('${controllerdrag.value.amount} - Selecionados')
        : const Text("HomePage");
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
                controllerdrag: controllerdrag,
                textapp: textapp,
                isSelected: isSelected);
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
    required controllerdrag,
    required textapp,
    required isSelected,
    required itens,
  }) {
    return Scaffold(
        body: DisableIndicator(
          trueOrFalse: true,
          child: AnimationLimiter(
              child: DragSelectGridView(
            shrinkWrap: true,
            primary: false,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
            ),
            physics: const BouncingScrollPhysics(),
            padding:
                const EdgeInsets.only(left: 4, right: 4, top: 0, bottom: 0),
            itemCount: itens.length,
            gridController: controllerdrag,
            scrollController: _scrollController,
            itemBuilder: (BuildContext ctxt, index, isSelected) => BuildGrid(
                itens: itens,
                isSelected: isSelected,
                index: index,
                textapp: textapp),
          )),
        ),
        appBar: AppBarToHide(
          title: textapp,
          controllerdrag: controllerdrag,
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
                  bloc.add(RemoveItemEvent(
                      descr: itens[1],
                      title: itens[1],
                      icon: itens[1],
                      urlfoto: itens[1]));
                },
                child: const Icon(Icons.done),
              )
            : Container());
  }

  // onLongPress: () {
  //   bloc.add(RemoveItemEvent(
  //       descr: itens[index],
  //       title: itens[index],
  //       icon: itens[index],
  //       urlfoto: itens[index]));
  // },
  Widget BuildGrid(
      {required itens, required isSelected, required index, required textapp}) {
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
                // onLongPress: () {
                //   bloc.add(RemoveItemEvent(
                //       descr: itens[index],
                //       title: itens[index],
                //       icon: itens[index],
                //       urlfoto: itens[index]));
                // },
                onTap: openContainer,
                child: SelectableItemWidget(
                  index: index,
                  itens: itens,
                  isSelected: isSelected,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
