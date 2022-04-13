// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, avoid_unnecessary_containers, unused_local_variable, must_be_immutable, non_constant_identifier_names

import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/blocs/Item_events.dart';
import 'package:void_01/src/env/models/blocs/Item_state.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/manga/config.dart';
import 'package:void_01/src/env/models/manga/mangapage.dart';
import 'package:void_01/src/env/models/manga/widget/appbar_scroll_to_hide.dart';
import 'package:void_01/src/env/models/manga/widget/disable_indicator.dart';
import 'package:void_01/src/env/models/manga/widget/navbar_scroll_to_hide_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  late ScrollController _scrollController;
  late final ItemBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = ItemBloc();
    bloc.add(LoadItemEvent());
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    bloc.close();
    super.dispose();
  }

  int indexscreen = 0;
  @override
  Widget build(BuildContext context) {
    final screen = [
      MainListaManga(),
      ConfigPage(),
    ];
    return Scaffold(
      body: screen[indexscreen],
      bottomNavigationBar: ScrollToHideWidgetState(
        controller: _scrollController,
        child: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.red,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
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

  Widget MainListaManga() => Scaffold(
        body: ListaManga(),
        appBar: AppBarToHide(
          title: Text("asdasds"),
          height: 80,
          position: 100,
          duration: Duration(milliseconds: 250),
          elevate: 0,
          color: Colors.transparent,
          controller: _scrollController,
        ),
      );

  Widget ListaManga() => DisableIndicator(
        trueOrFalse: true,
        child: AnimationLimiter(
          child: BlocBuilder<ItemBloc, ItemState>(
            bloc: bloc,
            builder: (context, state) {
              final itens = state.itens;

              if (state is ItemInitialState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ItemSuccessState) {
                return Gridbuild(itens: itens);
              }
              return Container();
            },
          ),
        ),
      );

  Widget Gridbuild({itens}) => GridView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        physics: const BouncingScrollPhysics(),
        itemCount: itens.length,
        controller: _scrollController,
        itemBuilder: (BuildContext ctxt, index) {
          return AnimationConfiguration.staggeredGrid(
            columnCount: itens.length,
            position: index,
            child: ScaleAnimation(
              duration: Duration(milliseconds: 500),
              child: FadeInAnimation(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 4, left: 5, right: 4, bottom: 8),
                  child: OpenContainer(
                    openColor: Colors.transparent,
                    closedElevation: 0,
                    openElevation: 0,
                    closedColor: Colors.transparent,
                    openShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    closedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    transitionType: ContainerTransitionType.fade,
                    transitionDuration: Duration(milliseconds: 670),
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
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                itens[index].title!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white.withOpacity(1),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    itens[index].urlfoto!,
                                    cacheKey: itens[index].urlfoto!),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                    Colors.black26, BlendMode.darken),
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 2,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: CachedNetworkImageProvider(
                                  itens[index].icon!,
                                  cacheKey: itens[index].icon!),
                            ),
                          ),
                        ],
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
