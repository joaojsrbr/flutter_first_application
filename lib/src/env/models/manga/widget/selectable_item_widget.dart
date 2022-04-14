import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SelectableItemWidget extends StatefulWidget {
  final bool isSelected;
  final dynamic itens;
  final int index;
  const SelectableItemWidget(
      {Key? key,
      required this.isSelected,
      required this.itens,
      required this.index})
      : super(key: key);

  @override
  State<SelectableItemWidget> createState() => _SelectableItemWidgetState();
}

class _SelectableItemWidgetState extends State<SelectableItemWidget>
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
  void didUpdateWidget(SelectableItemWidget oldWidget) {
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
                      padding: const EdgeInsets.all(8),
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
                        image: CachedNetworkImageProvider(
                            widget.itens[widget.index].urlfoto!,
                            cacheKey: widget.itens[widget.index].urlfoto!),
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.black26, BlendMode.darken),
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  Positioned(
                    bottom: widget.isSelected ? 2 * 11 : 2,
                    right: widget.isSelected ? 2 * 11 : 2,
                    child: (widget.isSelected == true)
                        ? const CircleAvatar(
                            child: Icon(Icons.check),
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: CachedNetworkImageProvider(
                                widget.itens[widget.index].icon!,
                                cacheKey: widget.itens[widget.index].icon!),
                          ),
                  ),
                ],
              ),
            ));
  }
}
