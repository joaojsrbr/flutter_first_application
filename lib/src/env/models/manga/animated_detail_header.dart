import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/dark_theme_provider.dart';

class AnimatedDetailHeader extends StatelessWidget {
  final String? imageURL;
  final double percent;
  final String title;
  final String descricao;
  const AnimatedDetailHeader({
    required this.imageURL,
    required this.percent,
    required this.title,
    required this.descricao,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    const _toptext = 90.0;
    const _toptext1 = 160.0;
    final _currentsizetest =
        (_toptext * (1 - percent)).clamp(160 / 2, _toptext);
    final _currenttoptext = (_toptext1 * (1 - percent)).clamp(160.0, _toptext1);
    // print(percent);

    return Column(
      children: [
        Expanded(
          child: PageView(
            physics: const BouncingScrollPhysics(),
            controller: PageController(viewportFraction: 1),
            children: [
              Container(
                decoration: BoxDecoration(
                  // boxShadow: const [
                  //   BoxShadow(blurRadius: 10, color: Colors.black12)
                  // ],
                  image: DecorationImage(
                    colorFilter: const ColorFilter.mode(
                        Colors.black26, BlendMode.darken),
                    // filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,

                    image: CachedNetworkImageProvider(imageURL!,
                        cacheKey: imageURL),
                  ),
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      top: _toptext / 2.5,
                      child: BackButton(color: Colors.white),
                    ),
                    Positioned(
                      top: _toptext / 2.5,
                      right: 2,
                      child: IconButton(
                          icon: Icon(_themeChange.darkTheme
                              ? Icons.dark_mode
                              : Icons.light_mode),
                          onPressed: () {
                            _themeChange.darkTheme = !_themeChange.darkTheme;
                          },
                          color: Colors.white),
                    ),
                    Positioned(
                      top: _currentsizetest,
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
                      top: _currenttoptext,
                      left: 10,
                      right: 2,
                      child: Opacity(
                        opacity: disappear(percent),
                        child: Text(
                          descricao,
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: 15,
                              letterSpacing: -0.2,
                              color: _themeChange.darkTheme
                                  ? Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant
                                  : Theme.of(context)
                                      .colorScheme
                                      .surfaceVariant),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        // const SizedBox(
        //   height: 50,
        // ),
        // const SizedBox(
        //   height: 50,
        // ),
      ],
    );
  }

  double disappear(double percent) => 1 - percent;
}
