import 'package:flutter/material.dart';

class AppBarToHideScoll2 extends StatefulWidget implements PreferredSizeWidget {
  final Widget? child;
  final ScrollController controller;
  final Duration duration;
  final double height;
  final Color? color;
  final double? elevate;
  final Text? title;
  final num position;
  const AppBarToHideScoll2({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    this.height = kToolbarHeight,
    this.child,
    this.color,
    this.elevate,
    this.title,
    this.position = 200,
    required this.controller,
  }) : super(key: key);

  @override
  State<AppBarToHideScoll2> createState() => _AppBarToHideState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarToHideState extends State<AppBarToHideScoll2> {
  bool isVisible = true;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  // void listen() {
  //   final direction = widget.controller.position.userScrollDirection;
  //   if (direction == ScrollDirection.forward) {
  //     show();
  //   } else if (direction == ScrollDirection.reverse) {
  //     hide();
  //   }
  // }

  void listen() {
    if (widget.controller.position.pixels >= widget.position) {
      hide();
    } else {
      show();
    }
  }

  void show() {
    if (!isVisible) {
      setState(() => isVisible = true);
    }
  }

  void hide() {
    if (isVisible) {
      setState(() => isVisible = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        key: widget.key,
        duration: widget.duration,
        height: isVisible ? widget.preferredSize.height : 0,
        child: Container());
  }
}
