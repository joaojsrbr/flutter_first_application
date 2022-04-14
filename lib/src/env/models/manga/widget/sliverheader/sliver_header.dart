import 'package:flutter/cupertino.dart';

class SliverHeader1 extends SliverPersistentHeaderDelegate {
  SliverHeader1(
      {required this.maxHeight, required this.minHeight, required this.child});

  final double maxHeight;
  final double minHeight;
  final Widget child;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(
      child: child,
    );
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
