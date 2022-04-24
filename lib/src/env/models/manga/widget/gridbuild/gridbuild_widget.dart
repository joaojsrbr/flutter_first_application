import 'package:animations/animations.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:void_01/src/env/models/manga/mangapage.dart';
import 'package:void_01/src/env/models/manga/widget/scroll_disableindicator_selecteditem/selected_item_widget.dart';

Widget gridbuild({itens, scrollController, controllerdrag}) {
  return DragSelectGridView(
    shrinkWrap: true,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
    ),
    padding: const EdgeInsets.only(top: 4),
    physics: const BouncingScrollPhysics(),
    itemCount: itens.length,
    gridController: controllerdrag,
    itemBuilder: (BuildContext ctxt, index, selected) {
      return AnimationConfiguration.staggeredGrid(
        columnCount: itens.length,
        position: index,
        child: ScaleAnimation(
          duration: const Duration(milliseconds: 250),
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
                  onTap: openContainer,
                  child: SelectView(
                    itens: itens,
                    index: index,
                    isSelected: selected,
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
