import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../../../theme/dark_theme_provider.dart';

class AnimatedDetailHeader extends StatefulWidget {
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
  State<AnimatedDetailHeader> createState() => _AnimatedDetailHeaderState();
}

class _AnimatedDetailHeaderState extends State<AnimatedDetailHeader>
    with TickerProviderStateMixin {
  bool checked = false;
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
    );
    _controller.duration = const Duration(milliseconds: 134);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    double disappear(double percent) => 1 - percent;
    const _toptext = 90.0;
    const _toptext1 = 160.0;
    final _currentsizetest =
        (_toptext * (1 - widget.percent)).clamp(160 / 2, _toptext);
    final _currenttoptext =
        (_toptext1 * (1 - widget.percent)).clamp(160.0, _toptext1);

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
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.36), BlendMode.darken),
                    // filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,

                    image: CachedNetworkImageProvider(widget.imageURL!,
                        cacheKey: widget.imageURL),
                  ),
                ),
                child: Stack(
                  children: [
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
                            _controller.forward();
                          } else {
                            _themeChange.darkTheme = false;
                            _controller.reverse();
                          }
                        },
                        child: Lottie.asset(
                            'assets/lottie/53164-light-dark-mode-button.json',
                            width: 70, onLoaded: (c) {
                          _controller.duration = c.duration;
                          _themeChange.darkTheme
                              ? _controller.forward()
                              : _controller.reverse();
                        }, controller: _controller, height: 70),
                      ),
                    ),
                    Positioned(
                      top: _currentsizetest,
                      left: 10,
                      right: 2,
                      child: Text(
                        widget.title,
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
                        opacity: disappear(widget.percent),
                        child: Text(
                          widget.descricao,
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
      ],
    );
  }
}



 // child: IconButton(
    //     icon: Icon(_themeChange.darkTheme
    //         ? Icons.dark_mode
    //         : Icons.light_mode),
    //     onPressed: () {
    //       _themeChange.darkTheme = !_themeChange.darkTheme;
    //     },
    //     color: Colors.white),
    // )