import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/manga/widget/animated_detail_header/animated_modal_controller.dart';
import 'package:void_01/src/env/models/manga/widget/build_image/build_image.dart';
import 'package:void_01/theme/dark_theme_provider.dart';

import '../../sumary.dart';

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
    //Provide DarkMode
    final _themeChange = Provider.of<DarkThemeProvider>(context);

    //Getput AnimatedDetailModalController
    Get.put(AnimatedDetailController());

    //Opacity
    double disappear(double percent) => 1 - percent;

    const _toptext = 90.0;

    const _toptext1 = 160.0;

    //Positioned >top< Tittle
    final _currenttitle = (_toptext * (1 - percent)).clamp(165.0 / 2, _toptext);

    //Positioned >top< Descrição
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
          top: _toptext / 2.8,
          right: 1,
          child: GestureDetector(
            onTap: () {
              if (_themeChange.darkTheme == false) {
                _themeChange.darkTheme = true;
                controller.controller.forward();
              } else {
                _themeChange.darkTheme = false;
                controller.controller.reverse();
              }
            },
            child: Lottie.asset(
                'assets/lottie/53164-light-dark-mode-button.json',
                width: 70, onLoaded: (c) {
              controller.controller.duration = c.duration;
              _themeChange.darkTheme
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
              color: _themeChange.darkTheme
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
                    color: _themeChange.darkTheme
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