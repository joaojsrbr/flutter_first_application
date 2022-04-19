import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';

class AppBarToHide extends StatefulWidget implements PreferredSizeWidget {
  final Widget? child;
  final ScrollController controller;
  final Duration duration;
  final double height;
  final Color? color;
  final double? elevate;
  final num position;
  final dynamic selection;

  const AppBarToHide({
    Key? key,
    this.selection = const Selection.empty(),
    this.duration = const Duration(milliseconds: 400),
    this.height = kToolbarHeight,
    this.child,
    this.color,
    this.elevate,
    this.position = 200,
    required this.controller,
  }) : super(key: key);

  @override
  State<AppBarToHide> createState() => _AppBarToHideState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _AppBarToHideState extends State<AppBarToHide> {
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
      duration: widget.duration,
      height: isVisible ? widget.preferredSize.height : 0,
      child: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        child: widget.selection.isSelecting
            ? AppBar(
                key: const Key('selecting'),
                title: Text('${widget.selection.amount} item(s) selected…'),
                elevation: widget.elevate,
                titleSpacing: 0,
                leading: widget.selection.isSelecting
                    ? const CloseButton()
                    : Container(),
                backgroundColor: widget.color,
              )
            : AppBar(
                key: const Key('not-selecting'),
                title: const Text("HomePage"),
                elevation: widget.elevate,
                leading: const SizedBox(width: 0, height: 0),
                leadingWidth: 0,
                backgroundColor: widget.color,
              ),
      ),
    );
  }
}
