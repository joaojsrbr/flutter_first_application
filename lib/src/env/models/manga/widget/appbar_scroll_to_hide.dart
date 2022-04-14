import 'package:flutter/material.dart';

import 'package:void_01/src/env/models/blocs/item_bloc.dart';
import 'package:void_01/src/env/models/blocs/item_events.dart';
import 'package:void_01/src/env/models/item/item.dart';

class AppBarToHide extends StatefulWidget implements PreferredSizeWidget {
  final Widget? child;
  final ScrollController controller;
  final Duration duration;
  final double height;
  final Color? color;
  final double? elevate;
  final Text? title;
  final num position;
  final dynamic controllerdrag;

  const AppBarToHide({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    this.height = kToolbarHeight,
    this.child,
    required this.controllerdrag,
    this.color,
    this.elevate,
    this.title,
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
  late final ItemBloc bloc;
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
      key: widget.key,
      duration: widget.duration,
      height: isVisible ? widget.preferredSize.height : 0,
      child: AppBar(
        title: widget.title,
        elevation: widget.elevate,
        backgroundColor: widget.color,
      ),
    );
  }
}
