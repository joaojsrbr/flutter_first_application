import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:void_01/src/env/models/blocs/Item_events.dart';
import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/manga/widget/animated_detail_header_gridview.dart';
import 'package:void_01/src/env/models/manga/widget/config/config.dart';
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
      _listaManga(context: context),
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

  Widget _listaManga({required context}) {
    final isSelected = _controllerdrag.value.isSelecting;
    return Stack(
      children: [
        BlocBuilder<ItemBloc, ItemState>(
          bloc: bloc,
          builder: (context, state) {
            final itens = state.itens;
            return CustomScrollView(
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
                // SliverAppBar(
                //     toolbarHeight: 30,
                //     floating: true,
                //     pinned: true,
                //     snap: true,
                //     backgroundColor: Colors.red),
                SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: SliverHeaderenv(
                        maxExtend: 40,
                        mixExtend: 20.0,
                        builder: (percent) => Container(
                              color: Colors.red,
                            ))),
                SliverToBoxAdapter(
                  child: gridbuild(
                      itens: itens,
                      controllerdrag: _controllerdrag,
                      scrollController: _scrollController),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
