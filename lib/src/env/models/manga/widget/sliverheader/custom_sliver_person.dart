import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final ScrollPhysics physics;

  const CustomSliverPerson2({
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Homepage2Controller _c = Get.find();
    return CustomScrollView(
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
                controllerdrag: _c.controllerdrag,
                scrollController: _c.scrollController,
                itens: itens,
                percent: percent,
              );
            },
          ),
        ),
        SliverToBoxAdapter(
          child: gridbuild(
            itens: itens,
          ),
        ),
      ],
    );
  }
}
