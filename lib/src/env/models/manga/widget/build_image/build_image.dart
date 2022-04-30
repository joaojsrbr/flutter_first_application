import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildImage(
    {required String image,
    double borderradius = 25.0,
    double height = 45.0,
    required bool avatar,
    FilterQuality filterQuality = FilterQuality.low,
    Color? color,
    BlendMode? colorBlendMode,
    BoxFit fit = BoxFit.cover,
    double width = 45.0}) {
  return BuildImaget(
    test: avatar,
    builder: (bool avatar) {
      return avatar
          ? ClipRRect(
              borderRadius: BorderRadius.circular(borderradius),
              child: CachedNetworkImage(
                imageUrl: image,
                colorBlendMode: colorBlendMode,
                height: height,
                filterQuality: filterQuality,
                width: width,
                fit: fit,
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(borderradius),
              child: CachedNetworkImage(
                colorBlendMode: colorBlendMode,
                imageUrl: image,
                filterQuality: filterQuality,
                color: color,
                width: double.infinity,
                fit: fit,
              ),
            );
    },
  );
}

class BuildImaget extends StatelessWidget {
  const BuildImaget({Key? key, required this.builder, this.test = false})
      : super(key: key);
  final bool test;
  final Widget Function(bool) builder;

  @override
  Widget build(BuildContext context) {
    return builder(test);
  }
}
