// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/blocs/item_events.dart';
import 'package:void_01/src/env/models/blocs/item_state.dart';
import 'package:void_01/src/env/models/item/item.dart';
import 'package:void_01/src/env/models/manga/configpage/configpage.dart';
import 'package:void_01/src/env/models/manga/fav_page.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';

import 'package:void_01/src/env/models/manga/widget/navbar/navbar_scroll_to_hide_widget.dart';
import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_sliver_person.dart';

class Homepage extends GetView<Homepage2Controller> {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Homepage2Controller _c =
    Get.put(Homepage2Controller());
    final _screen = [
      _listaManga(context: context),
      const FavoritePage(),
      const ConfigPage(),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(() => _screen[controller.indexscreen.value]),
      bottomNavigationBar: controller.controllerdrag.value.isSelecting
          ? Container(
              height: 0,
            )
          : Obx(
              () => ScrollToHideWidgetState(
                // controller: controller._scrollController,
                scrollcontroller: controller.scrollController,
                child: NavigationBarTheme(
                  data: NavigationBarThemeData(
                    labelTextStyle: MaterialStateProperty.all(
                      const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ),
                  child: NavigationBar(
                    selectedIndex: controller.indexscreen.value,
                    onDestinationSelected: (index) =>
                        controller.downloadCondition(index),
                    //  controller.indexscreen = index),
                    height: 60,
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                    labelBehavior:
                        NavigationDestinationLabelBehavior.alwaysHide,
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
                        selectedIcon: Icon(Icons.favorite),
                        label: "Favorito",
                        icon: Icon(Icons.favorite_outline),
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
            ),
    );
  }

  Widget _listaManga({required context}) {
    return BlocBuilder<ItemBloc, ItemState>(
      bloc: controller.bloc,
      builder: (context, state) {
        final itens = state.itens;
        void addonPressed() {
          final _keys = controller.controllerdrag.value.selectedIndexes
              .map<Item>((index) => itens![index])
              .toList();

          controller.bloc.add(AddItemEvent(key: _keys));
          // _keys.forEach((element) {
          //   bloc.add(AddItemEvent(key: element));
          // });
          controller.controllerdrag.clear();
        }

        void onremovePressed() {
          final key = controller.controllerdrag.value.selectedIndexes
              .map<dynamic>((index) => itens![index].key);
          key.forEach(
            (element) {
              controller.bloc.add(
                RemoveItemEvent(
                  key: element,
                ),
              );
            },
          );
          controller.controllerdrag.clear();
        }

        return CustomSliverPerson2(
          pinned: true,
          floating: true,
          itens: itens,
          onaddPressed: addonPressed,
          onremovePresed: onremovePressed,
          title: 'HomePage',
        );
      },
    );
  }
}

//

// class Homepage2 extends StatefulWidget {
//   const Homepage2({Key? key}) : super(key: key);

//   @override
//   State<Homepage2> createState() => _Homepage2State();
// }

// class _Homepage2State extends State<Homepage2> {
//   List selecionadas = [];
//   // sreen index
//   int indexscreen = 0;
//   // Bloc
//   late final ItemBloc bloc;
//   // Scroll Controller
//   late ScrollController _scrollController;
//   // Select Controller
//   final _controllerdrag = DragSelectGridViewController();

//   @override
//   void initState() {
//     super.initState();
//     bloc = ItemBloc();
//     bloc.add(LoadItemEvent());
//     _controllerdrag.addListener(rebuild);
//     _scrollController = ScrollController();
//   }

//   @override
//   void dispose() {
//     bloc.close();
//     _scrollController.dispose();
//     _controllerdrag.removeListener(rebuild);
//     super.dispose();
//   }

//   void rebuild() => setState(() {});

//   @override
//   Widget build(BuildContext context) {
//     final _screen = [
//       listaManga(context: context),
//       FavoritePage(
//         bloc: bloc,
//       ),
//       const ConfigPage(),
//     ];

//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: _screen[indexscreen],
//       bottomNavigationBar: _controllerdrag.value.isSelecting
//           ? Container(
//               height: 0,
//             )
//           : ScrollToHideWidgetState(
//               controller: _scrollController,
//               child: NavigationBarTheme(
//                 data: NavigationBarThemeData(
//                   labelTextStyle: MaterialStateProperty.all(
//                     const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 child: NavigationBar(
//                   selectedIndex: indexscreen,
//                   onDestinationSelected: (index) =>
//                       setState(() => indexscreen = index),
//                   height: 60,
//                   backgroundColor: Theme.of(context).colorScheme.onSecondary,
//                   labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
//                   destinations: const [
//                     NavigationDestination(
//                       selectedIcon: Icon(
//                         Icons.book_rounded,
//                       ),
//                       label: "Manga",
//                       icon: Icon(
//                         Icons.book_outlined,
//                       ),
//                     ),
//                     NavigationDestination(
//                       selectedIcon: Icon(Icons.favorite),
//                       label: "Favorito",
//                       icon: Icon(Icons.favorite_outline),
//                     ),
//                     NavigationDestination(
//                       selectedIcon: Icon(
//                         Icons.settings,
//                       ),
//                       label: "Config",
//                       icon: Icon(
//                         Icons.settings_outlined,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget listaManga({required context}) {
//     return BlocBuilder<ItemBloc, ItemState>(
//       bloc: bloc,
//       builder: (context, state) {
//         final itens = state.itens;
//         void addonPressed() {
//           final _keys = _controllerdrag.value.selectedIndexes
//               .map<Item>((index) => itens![index])
//               .toList();

//           bloc.add(AddItemEvent(key: _keys));
//           // _keys.forEach((element) {
//           //   bloc.add(AddItemEvent(key: element));
//           // });
//           _controllerdrag.clear();
//         }

//         void onremovePressed() {
//           final key = _controllerdrag.value.selectedIndexes
//               .map<dynamic>((index) => itens![index].key);
//           key.forEach(
//             (element) {
//               bloc.add(
//                 RemoveItemEvent(
//                   key: element,
//                 ),
//               );
//             },
//           );
//           _controllerdrag.clear();
//         }

//         return CustomSliverPerson(
//           pinned: true,
//           floating: true,
//           controllerdrag: _controllerdrag,
//           scrollController: _scrollController,
//           itens: itens,
//           onaddPressed: addonPressed,
//           onremovePresed: onremovePressed,
//           title: 'HomePage',
//         );
//       },
//     );
//   }
// }
