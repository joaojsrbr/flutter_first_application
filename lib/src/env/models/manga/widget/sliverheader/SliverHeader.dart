// ignore_for_file: file_names, avoid_print

import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:void_01/src/env/models/manga/sumary.dart';

class SliverHeader extends SliverPersistentHeaderDelegate {
  SliverHeader(
      {required this.maxHeight,
      required this.minHeight,
      this.child,
      this.desc,
      required this.title,
      this.image});

  final String? image;
  final String? desc;
  final String title;
  final double maxHeight;
  final double minHeight;
  final Widget? child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const _maxsizeimage = 250;
    const _maxsizetext = 100;
    const _maxbottomsize = 190.0;
    const _leftimage = 5.0;
    const _maxwedthimage = 176.0;
    const _minrighttext = 4;
    const _bottomimage = 9.0;

    final double possition = shrinkOffset / maxHeight;

    // final _currentopimage = (0 + (70 * possition));
    final _currentwedthimage =
        (_maxwedthimage * (1 - possition)).clamp(60.0, _maxwedthimage);
    final _leftcurrentimage =
        _leftimage - (_leftimage * possition).clamp(0.0, _leftimage);
    final _currentbottomimage =
        _bottomimage - (_bottomimage * possition).clamp(0.0, _bottomimage);
    final _currentbottomsize = _maxbottomsize - (170 * possition);

    final _currentsizetest =
        (_maxsizetext * (1 - possition)).clamp(minHeight, maxHeight);
    final _currentrightsize = _minrighttext + (120 * possition);
    final _currentImagesize =
        (_maxsizeimage * (1 - possition)).clamp(minHeight, maxHeight);
    double disappear(double shrinkOffset) => 1 - shrinkOffset / maxHeight;
    print(possition);

    // final size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          Positioned(
            bottom: _currentbottomimage,
            left: _leftcurrentimage,
            height: _currentImagesize,
            width: _currentwedthimage,
            child: CachedNetworkImage(
              imageUrl: image!,
              fit: BoxFit.cover,
              cacheKey: image!,
            ),
          ),
          //////////////////////////////////////////////////////
          Positioned(
            right: _currentrightsize,
            height: _currentsizetest,
            bottom: _currentbottomsize,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              height: 80,
              width: 200,
              child: Text(
                title,
                style: const TextStyle(
                    letterSpacing: -0.2,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 35,
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              height: 200,
              width: 200,
              child: Opacity(
                opacity: disappear(shrinkOffset),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Sumary(
                          descricao: desc!,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    desc!,
                    maxLines: 9,
                    style: const TextStyle(
                      letterSpacing: -0.2,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  double titleOpacity(double shrinkOffset) {
    return 1 - max(0.5, shrinkOffset) / maxExtent;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
