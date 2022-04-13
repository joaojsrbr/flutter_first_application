import 'package:flutter/material.dart';

class ScrollToHideWidgetState extends StatefulWidget {
  final Widget child;
  final ScrollController controller;
  final Duration duration;
  final double height;

  const ScrollToHideWidgetState(
      {Key? key,
      required this.child,
      required this.controller,
      this.duration = const Duration(milliseconds: 200),
      this.height = kBottomNavigationBarHeight})
      : super(key: key);

  @override
  State<ScrollToHideWidgetState> createState() =>
      __ScrollToHideWidgetStateState();
}

class __ScrollToHideWidgetStateState extends State<ScrollToHideWidgetState> {
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
    if (widget.controller.position.pixels >= 200) {
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
  Widget build(BuildContext context) => AnimatedContainer(
        duration: widget.duration,
        height: isVisible ? widget.height : 0,
        child: Wrap(
          children: [widget.child],
        ),
      );
}
