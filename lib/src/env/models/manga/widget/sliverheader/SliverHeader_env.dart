import 'package:flutter/cupertino.dart';

class SliverHeader_env extends SliverPersistentHeaderDelegate {
  SliverHeader_env(
      {required this.maxExtend,
      required this.mixExtend,
      required this.builder});

  final Widget Function(double percent) builder;
  final double maxExtend;
  final double mixExtend;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return builder(shrinkOffset / maxExtend);
  }

  @override
  double get maxExtent => maxExtend;

  @override
  double get minExtent => mixExtend;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
