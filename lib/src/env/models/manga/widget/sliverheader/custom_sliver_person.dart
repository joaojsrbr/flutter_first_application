import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';

import 'package:void_01/src/env/models/manga/widget/sliverheader/sliver_header_prod.dart';

import '../animated_detail_header_gridview.dart';
import '../gridbuild/gridbuild_widget.dart';

class CustomSliverPerson extends StatelessWidget {
  final dynamic itens;
  final DragSelectGridViewController controllerdrag;
  final ScrollController scrollController;
  final double maxExtend;
  final double mixExtend;
  final VoidCallback? onaddPressed;
  final VoidCallback? onremovePresed;
  final bool floating;
  final bool pinned;
  final String title;
  final ScrollPhysics physics;

  const CustomSliverPerson({
    Key? key,
    required this.itens,
    this.title = '',
    this.physics = const BouncingScrollPhysics(),
    this.floating = false,
    this.pinned = false,
    this.maxExtend = 110.0,
    this.mixExtend = 90.0,
    this.onaddPressed,
    this.onremovePresed,
    required this.controllerdrag,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
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
                controllerdrag: controllerdrag,
                scrollController: scrollController,
                itens: itens,
                percent: percent,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: gridbuild(
              itens: itens,
              controllerdrag: controllerdrag,
              scrollController: scrollController),
        ),
      ],
    );
  }
}
