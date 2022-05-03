import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:void_01/src/env/models/manga/widget/animated_detail_header/animated_modal_controller.dart';
import 'package:void_01/src/env/models/manga/widget/build_image/build_image.dart';
import 'package:void_01/theme/theme_provider.dart';

import '../../sumary/sumary.dart';

class AnimatedDetailHeader extends GetView<AnimatedDetailController> {
  final String? imageURL;
  final double percent;
  final String title;
  final String descricao;
  const AnimatedDetailHeader(
      {required this.imageURL,
      required this.percent,
      required this.title,
      required this.descricao,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //DarkMode
    final themeChange = ThemeController.to;

    //Getput AnimatedDetailModalController
    Get.put(AnimatedDetailController());

    //Opacity
    double disappear(double percent) => 1 - percent;

    const _toptext = 95.0;

    const _toptext1 = 160.0;

    //Position >top< Tittle
    final _currenttitle = (_toptext * (1 - percent)).clamp(175.0 / 2, _toptext);

    //Position >top< Descrição
    final _currentdescricao =
        (_toptext1 * (1 - percent)).clamp(160.0, _toptext1);

    return Stack(
      children: [
        buildImage(
            image: imageURL!,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.32),
            borderradius: 0,
            filterQuality: FilterQuality.high,
            colorBlendMode: BlendMode.darken,
            avatar: false),
        const Positioned(
          top: _toptext / 2.5,
          child: BackButton(color: Colors.white),
        ),
        Positioned(
          top: _toptext / 3.55,
          right: 0,
          child: GestureDetector(
            onTap: () {
              if (themeChange.isDark.value == false) {
                themeChange.changeTheme();
                controller.controller.forward();
              } else {
                themeChange.changeTheme();
                controller.controller.reverse();
              }
            },
            child: Lottie.asset(
                'assets/lottie/53164-light-dark-mode-button.json',
                width: 70, onLoaded: (c) {
              controller.controller.duration = c.duration;
              themeChange.isDark.value
                  ? controller.controller.forward()
                  : controller.controller.reverse();
            }, controller: controller.controller, height: 70),
          ),
        ),
        Positioned(
          top: _currenttitle,
          left: 10,
          right: 2,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 23,
              color: themeChange.isDark.value
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onTertiary,
              letterSpacing: -0.2,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: _currentdescricao,
          left: 10,
          right: 2,
          child: Opacity(
            opacity: disappear(percent),
            child: GestureDetector(
              onTap: () => Get.to(Sumary(
                descricao: descricao,
              )),
              child: Text(
                descricao,
                maxLines: 10,
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: -0.2,
                    color: themeChange.isDark.value
                        ? Theme.of(context).colorScheme.onSurfaceVariant
                        : Theme.of(context).colorScheme.surfaceVariant),
              ),
            ),
          ),
        )
      ],
    );
  }
}
