// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:void_01/src/env/models/item/repository.dart';
import 'package:void_01/src/env/models/manga/configpage/configpage.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_page.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';
import 'package:void_01/src/env/models/manga/widget/navbar/navbar_scroll_to_hide_widget.dart';
import 'package:void_01/src/env/models/manga/widget/sliverheader/custom_sliver_person.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';

class Homepage extends GetResponsiveView<Homepage2Controller> {
  Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Homepage2Controller());

    Get.put(FavoritePageController());

    final _screen = [
      _listaManga(),
      FavoritePage(),
      const ConfigPage(),
    ];

    return GetBuilder<Homepage2Controller>(
      builder: (controller) => GetBuilder<FavoritePageController>(
        builder: (controllerfav) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Obx(() => _screen[controller.indexscreen.value]),
          bottomNavigationBar:
              controllerfav.controllerdragfavorite.value.isSelecting |
                      controller.controllerdrag.value.isSelecting
                  ? Container(
                      height: 0,
                    )
                  : Obx(
                      () => ScrollToHideWidgetState(
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
                            //  controller.indexscreen = index))),
                            height: 60,
                            backgroundColor:
                                Theme.of(context).colorScheme.background,
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
        ),
      ),
    );
  }

  Widget _listaManga() {
    return Consumer<Itemrepository>(
      builder: (context, state, _) {
        final itens = state.lista;

        return CustomSliverPerson<Homepage2Controller>(
          isNotEmpty: state.lista.isNotEmpty,
          tabController: controller.tabController,
          key: const Key('SliverHomepage'),
          homepage: true,
          itens: itens,
          controllerdrag: controller.controllerdrag,
          title: 'HomePage',
          maxExtend: 60,
          mixExtend: 50,
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          pinned: true,
          floating: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          tabs: [
            Tab(
              child: Text(
                "asdasd",
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ),
            Tab(
              child: Text(
                "asdasd",
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ),
          ],
          actions: [
            IconButton(
              key: const Key('onaddPressed'),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                controller.addonPressed(itens);
                controller.controllerdrag.clear();
              },
              icon: const Icon(Icons.add),
            ),
            // IconButton(
            //   key: const Key('onremovePresed'),
            //   color: Theme.of(context).colorScheme.secondary,
            //   icon: const Icon(Icons.delete_outline),
            //   onPressed: () {
            //     controller.onremovePressed(itens, state);
            //     controller.controllerdrag.clear();
            //   },
            // )
          ],
        );
      },
    );
  }
}
