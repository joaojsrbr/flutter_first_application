import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';

import 'package:void_01/src/env/models/manga/widget/build_image/build_image.dart';
import 'package:void_01/theme/theme_provider.dart';

class SelectView extends StatefulWidget {
  final dynamic itens;
  final int index;
  final bool isSelected;
  const SelectView({
    Key? key,
    required this.index,
    required this.itens,
    required this.isSelected,
  }) : super(key: key);

  @override
  State<SelectView> createState() => _SelectViewState();
}

class _SelectViewState extends State<SelectView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      value: widget.isSelected ? 1 : 0,
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease,
    ));
  }

  @override
  void didUpdateWidget(SelectView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        controller.forward();
      } else {
        controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = ThemeController.to;

    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) => Transform.scale(
        scale: scaleAnimation.value,
        child: Stack(
          children: [
            buildImage(
                height: context.mediaQuerySize.height,
                width: context.mediaQuerySize.width,
                image: widget.itens[widget.index].urlfoto!,
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.32),
                borderradius: 12,
                colorBlendMode: BlendMode.darken,
                avatar: false),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.itens[widget.index].title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: themeChange.isDark.value
                        ? Theme.of(context).colorScheme.primary.withOpacity(1)
                        : Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(1),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 2, right: 2),
                child: buildImage(
                    image: widget.itens[widget.index].icon!,
                    width: 40,
                    height: 40,
                    borderradius: 36,
                    avatar: true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
