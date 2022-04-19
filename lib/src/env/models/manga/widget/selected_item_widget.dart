import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
    return AnimatedBuilder(
      animation: scaleAnimation,
      builder: (context, child) => Transform.scale(
        scale: scaleAnimation.value,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.itens[widget.index].title!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white.withOpacity(1),
                    fontSize: 15,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  filterQuality: FilterQuality.high,
                  image: CachedNetworkImageProvider(
                      widget.itens[widget.index].urlfoto!,
                      cacheKey: widget.itens[widget.index].urlfoto!),
                  fit: BoxFit.cover,
                  colorFilter:
                      const ColorFilter.mode(Colors.black26, BlendMode.darken),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Positioned(
              bottom: 2,
              right: 2,
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: CachedNetworkImageProvider(
                    widget.itens[widget.index].icon!,
                    cacheKey: widget.itens[widget.index].icon!),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
