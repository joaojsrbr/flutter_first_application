// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/blocs/item_state.dart';
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
          : ScrollToHideWidgetState(
              child: NavigationBarTheme(
                data: NavigationBarThemeData(
                  labelTextStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ),
                child: Obx(
                  () => NavigationBar(
                    selectedIndex: controller.indexscreen.value,
                    onDestinationSelected: (index) =>
                        controller.downloadCondition(index),
                    //  controller.indexscreen = index)),
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

        return CustomSliverPerson2(
          pinned: true,
          floating: true,
          itens: itens,
          onaddPressed: () => controller.addonPressed(itens),
          onremovePresed: () => controller.onremovePressed(itens),
          title: 'HomePage',
        );
      },
    );
  }
}
