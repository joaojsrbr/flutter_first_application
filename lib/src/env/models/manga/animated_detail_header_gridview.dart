import 'package:flutter/material.dart';

class AnimatedDetailGridView extends StatefulWidget {
  final double percent;
  final String title;
  final dynamic itens;
  final dynamic controllerdrag;
  final dynamic scrollController;
  final bool isSelected;
  const AnimatedDetailGridView({
    required this.itens,
    required this.percent,
    required this.title,
    required this.controllerdrag,
    required this.scrollController,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedDetailGridView> createState() => _AnimatedDetailGridViewState();
}

class _AnimatedDetailGridViewState extends State<AnimatedDetailGridView> {
  @override
  void initState() {
    super.initState();

    widget.controllerdrag.addListener(rebuild);
  }

  @override
  void dispose() {
    widget.controllerdrag.removeListener(rebuild);
    super.dispose();
  }

  void rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    // const _toptext1 = 160.0;
    // final _currenttoptext =
    //     (_toptext1 * (1 - widget.percent)).clamp(160.0, _toptext1);
    // print(percent);
    const _toptext = 50.0;
    final _currentsizetest =
        (_toptext * (1.0 - widget.percent)).clamp(90 / 2, _toptext);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Column(children: [
        Expanded(
            child: PageView(
          children: [
            Stack(
              children: [
                widget.controllerdrag.value.isSelecting
                    ? Positioned(
                        top: _currentsizetest,
                        left: 10,
                        right: 2,
                        key: const Key('selecting'),
                        child: Text(
                          '${widget.controllerdrag.value.amount} item(s) selected…',
                          style: const TextStyle(
                            fontSize: 23,
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : Positioned(
                        top: _currentsizetest,
                        left: 10,
                        right: 2,
                        key: const Key('not-selecting'),
                        child: const Text(
                          "Home Page",
                          style: TextStyle(
                            fontSize: 23,
                            letterSpacing: -0.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
              ],
            )
          ],
        )),
      ]),
    );
  }
}
