// ignore_for_file: unused_element

import 'package:animations/animations.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

import 'package:void_01/src/env/models/manga/mangapage/mangapage.dart';
import 'package:void_01/src/env/models/manga/widget/selected_item/selected_item.dart';

class Gridbuild<T extends GetxController> extends StatelessWidget {
  final List itens;

  final T? init;
  final DragSelectGridViewController controllerdrag;
  final ScrollController? scrollController;
  const Gridbuild(
      {Key? key,
      this.scrollController,
      this.init,
      required this.itens,
      required this.controllerdrag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      child: GetBuilder<T>(
        builder: (controller) => DragSelectGridView(
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
                duration: const Duration(milliseconds: 150),
                child: FadeInAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 4, left: 5, right: 4, bottom: 8),
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
                      transitionDuration: const Duration(milliseconds: 1000),
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
        ),
      ),
    );
    // : GetBuilder<FavoritePageController>(
    //     builder: (controller) => DragSelectGridView(
    //       shrinkWrap: true,
    //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         crossAxisSpacing: 10,
    //       ),
    //       padding: const EdgeInsets.only(top: 4),
    //       physics: const BouncingScrollPhysics(),
    //       itemCount: itens.length,
    //       gridController: controllerdrag,
    //       itemBuilder: (BuildContext ctxt, index, selected) {
    //         // print(selected);
    //         return AnimationConfiguration.staggeredGrid(
    //           columnCount: itens.length,
    //           position: index,
    //           child: ScaleAnimation(
    //             duration: const Duration(milliseconds: 150),
    //             child: FadeInAnimation(
    //               child: Padding(
    //                 padding: const EdgeInsets.only(
    //                     top: 4, left: 5, right: 4, bottom: 8),
    //                 child: OpenContainer(
    //                   openColor: Colors.transparent,
    //                   closedElevation: 0,
    //                   openElevation: 0,
    //                   closedColor: Colors.transparent,
    //                   openShape: const RoundedRectangleBorder(
    //                       borderRadius:
    //                           BorderRadius.all(Radius.circular(15))),
    //                   closedShape: const RoundedRectangleBorder(
    //                       borderRadius:
    //                           BorderRadius.all(Radius.circular(15))),
    //                   transitionType: ContainerTransitionType.fade,
    //                   transitionDuration:
    //                       const Duration(milliseconds: 1000),
    //                   openBuilder: (context, _) => MangaPage(
    //                       title: itens[index].title,
    //                       image: itens[index].urlfoto,
    //                       desc: itens[index].descr),
    //                   closedBuilder:
    //                       (context, VoidCallback openContainer) =>
    //                           GestureDetector(
    //                     onTap: openContainer,
    //                     child: SelectView(
    //                       itens: itens,
    //                       index: index,
    //                       isSelected: selected,
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //           ),
    //         );
    //       },
    //     ),
    //   );
  }
}

// class _FadeThroughTransitionSwitcher extends StatelessWidget {
//   const _FadeThroughTransitionSwitcher({
//     required this.fillColor,
//     required this.child,
//   });

//   final Widget child;
//   final Color fillColor;

//   @override
//   Widget build(BuildContext context) {
//     return PageTransitionSwitcher(
//       transitionBuilder: (child, animation, secondaryAnimation) {
//         return FadeThroughTransition(
//           fillColor: fillColor,
//           child: child,
//           animation: animation,
//           secondaryAnimation: secondaryAnimation,
//         );
//       },
//       child: child,
//     );
//   }
// }
