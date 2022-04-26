import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/blocs/Item_events.dart';

import 'package:void_01/src/env/models/blocs/item_bloc.dart';

import 'package:void_01/src/env/models/manga/config/config.dart';
import 'package:void_01/src/env/models/manga/widget/animated_detail_header_gridview.dart';
import 'package:void_01/src/env/models/manga/widget/gridbuild/gridbuild_widget.dart';

import 'package:void_01/src/env/models/manga/widget/appbar_navbar/navbar_scroll_to_hide_widget.dart';
import 'package:void_01/src/env/models/manga/widget/sliverheader/sliver_header_prod.dart';

import '../blocs/item_state.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  // sreen index
  int indexscreen = 0;
  // Bloc
  late final ItemBloc bloc;
  // Scroll Controller
  late ScrollController _scrollController;
  // Select Controller
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

  void onPressed(selectedindex) {
    setState(
      () {
        selectedindex.forEach(
          (element) {
            bloc.add(
              RemoveItemEvent(
                key: element,
              ),
            );
          },
        );
        _controllerdrag.clear();
      },
    );
  }

  void rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final _screen = [
      BlocBuilder<ItemBloc, ItemState>(
        bloc: bloc,
        key: const Key('Bloc'),
        builder: (context, state) {
          final itens = state.itens;

          // print(itens2![1].list![0].title);
          if (state is ItemInitialState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ItemSuccessState) {
            return _listaManga(context: context, itens: itens);
          }
          return Container();
        },
      ),
      const ConfigPage(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: _screen[indexscreen],
      bottomNavigationBar: _controllerdrag.value.isSelecting
          ? Container(
              height: 0,
            )
          : ScrollToHideWidgetState(
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

  // Widget _buttombar({itens, context}) {
  //   // int indexbuttom = 0;

  //   void addlista() {}
  //   bottomac() {
  //     print("asdasd");
  //     // final selectedindex = _controllerdrag.value.selectedIndexes
  //     //     .map<dynamic>((index) => itens[index].key);
  //     // onPressed(selectedindex);
  //   }

  //   // List buttomaction = [bottomac, addlista];

  //   return Padding(
  //     padding: const EdgeInsets.only(left: 10.0, right: 10.0),
  //     child: Align(
  //       alignment: const Alignment(0.0, 1.0),
  //       child: ScrollWidgetState(
  //         height: 80,
  //         child: ClipRRect(
  //           borderRadius: const BorderRadius.all(Radius.circular(8)),
  //           child: Container(
  //             color: Theme.of(context).colorScheme.background,
  //             child: Row(
  //               // mainAxisSize: MainAxisSize.min,
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 SizedBox(
  //                   width: MediaQuery.of(context).size.width * 0.02,
  //                 ),
  //                 Expanded(
  //                   child: ElevatedButton(
  //                     child: Text('Excruir'),
  //                     onPressed: () {},
  //                     bottomac
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: MediaQuery.of(context).size.width * 0.02,
  //                 ),
  //                 Expanded(
  //                   child: ElevatedButton(
  //                     child: Text('Hello'),
  //                     onPressed: null,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: MediaQuery.of(context).size.width * 0.02,
  //                 ),
  //                 Expanded(
  //                   child: ElevatedButton(
  //                     child: Text('Hi'),
  //                     onPressed: null,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: MediaQuery.of(context).size.width * 0.02,
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _listaManga({required itens, required context}) {
    final isSelected = _controllerdrag.value.isSelecting;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(children: [
        CustomScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverPersistentHeader(
              pinned: isSelected ? true : false,
              floating: true,
              delegate: SliverHeaderenv(
                // maxExtend: MediaQuery.of(context).size.height,
                maxExtend: 110,
                mixExtend: 90,
                builder: (percent) {
                  return AnimatedDetailGridView(
                    title: "Homepage",
                    bloc: bloc,
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
        // _controllerdrag.value.isSelecting
        //     ? _buttombar(itens: itens, context: context)
        //     : Container(
        //         height: 0,
        //       )
      ]),
      // floatingActionButton: (isSelected)
      //     ? FloatingActionButton(
      //         backgroundColor: Colors.red,
      //         onPressed: () {
      //           final selectedindex = _controllerdrag.value.selectedIndexes
      //               .map<dynamic>((index) => itens[index].key);
      //           onPressed(selectedindex);
      //         },
      //         child: const Icon(Icons.done),
      //       )
      //     : Container(),
    );
  }
}
