import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:void_01/src/env/models/manga/favoritepage/favorite_pageController.dart';
import 'package:void_01/src/env/models/manga/homepage/homepage_controller.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/sliver_header_prod.dart';

import '../animated_detail_header_gridview.dart';
import '../grid_build/gridbuild_widget.dart';

class CustomSliverPerson2 extends StatelessWidget {
  final dynamic itens;
  final double maxExtend;
  final double mixExtend;
  final VoidCallback? onaddPressed;
  final VoidCallback? onremovePresed;
  final bool floating;
  final bool pinned;
  final String title;
  final bool homepage;
  final ScrollPhysics physics;
  final bool isNotEmpty;
  const CustomSliverPerson2({
    Key? key,
    required this.homepage,
    required this.itens,
    this.title = '',
    required this.isNotEmpty,
    this.physics = const BouncingScrollPhysics(),
    this.floating = false,
    this.pinned = false,
    this.maxExtend = 110.0,
    this.mixExtend = 90.0,
    this.onaddPressed,
    this.onremovePresed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Homepage2Controller _c = Get.find();
    final FavoritePageController _d = Get.find();

    return isNotEmpty
        ? CustomScrollView(
            key: const Key('isEmpty'),
            controller: _c.scrollController,
            physics: physics,
            slivers: [
              SliverPersistentHeader(
                // pinned: controllerdrag.value.isSelecting ? true : false,
                pinned: pinned,
                floating: floating,
                delegate: SliverHeaderenv(
                  // maxExtend: MediaQuery.of(context).size.height,
                  maxExtend: maxExtend,
                  mixExtend: mixExtend,
                  builder: (percent) {
                    return AnimatedDetailGridView(
                      title: title,
                      onremovePresed: onremovePresed,
                      onaddPressed: onaddPressed,
                      controllerdrag: homepage
                          ? _c.controllerdrag
                          : _d.controllerdragfavorite,
                      scrollController: _c.scrollController,
                      itens: itens,
                      percent: percent,
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Gridbuild(
                  homepage: homepage,
                  controllers:
                      homepage ? _c.controllerdrag : _d.controllerdragfavorite,
                  itens: itens,
                ),
              ),
            ],
          )
        : CustomScrollView(
            key: const Key('isNotEmpty'),
            controller: _c.scrollController,
            physics: physics,
            slivers: [
              SliverPersistentHeader(
                // pinned: controllerdrag.value.isSelecting ? true : false,
                pinned: pinned,
                floating: floating,
                delegate: SliverHeaderenv(
                  // maxExtend: MediaQuery.of(context).size.height,
                  maxExtend: maxExtend,
                  mixExtend: mixExtend,
                  builder: (percent) {
                    return AnimatedDetailGridView(
                      title: title,
                      onremovePresed: onremovePresed,
                      onaddPressed: onaddPressed,
                      controllerdrag: homepage
                          ? _c.controllerdrag
                          : _d.controllerdragfavorite,
                      scrollController: _c.scrollController,
                      itens: itens,
                      percent: percent,
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                      top: context.mediaQueryViewPadding.top * 9.5),
                  child: Center(
                    child: Text(
                      '¯\\_(ツ)_/¯',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 50,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
