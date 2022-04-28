import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';

class AnimatedDetailGridView extends StatefulWidget {
  final double percent;
  final String? title;
  final dynamic itens;
  final VoidCallback? onaddPressed;
  final VoidCallback? onremovePresed;
  final DragSelectGridViewController controllerdrag;
  final ScrollController scrollController;

  final VoidCallback? onPressed;
  const AnimatedDetailGridView({
    required this.itens,
    this.onPressed,
    this.onremovePresed,
    this.onaddPressed,
    required this.percent,
    this.title,
    required this.controllerdrag,
    required this.scrollController,
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

  Widget buildButton(
          {required String text,
          required IconData icon,
          required void Function()? onPressed}) =>
      ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.red),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Icon(
                icon,
              ),
            ),
          ],
        ),
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) {
    const _toptext = 45.0;

    final _currentsizetest =
        (50.0 * (1.0 - widget.percent)).clamp(45.0, 100.0 / 2);
    final _currentsizetes2t =
        (_toptext * (1.0 - widget.percent)).clamp(35.0, 55.0);

    // final _themeChange = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onSecondary,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              children: [
                Stack(
                  children: [
                    widget.controllerdrag.value.isSelecting
                        ? Positioned(
                            top: _currentsizetes2t,
                            left: 2,
                            right: 2,
                            key: const Key('selecting'),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widget.controllerdrag.value.isSelecting
                                    ? IconButton(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        onPressed: () {
                                          if (widget.onPressed != null) {
                                            widget.onPressed!();
                                          } else {
                                            Navigator.maybePop(context);
                                          }
                                        },
                                        icon: const Icon(Icons.close),
                                        tooltip:
                                            MaterialLocalizations.of(context)
                                                .closeButtonTooltip,
                                      )
                                    : const SizedBox(
                                        height: 0,
                                        width: 0,
                                      ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                                Expanded(
                                  child: Text(
                                    '${widget.controllerdrag.value.amount}',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 20,
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  onPressed: widget.onaddPressed,
                                  icon: const Icon(Icons.add),
                                ),
                                IconButton(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: widget.onremovePresed,
                                ),
                              ],
                            ),
                          )
                        : Positioned(
                            top: _currentsizetest,
                            left: 10,
                            key: const Key('not-selecting'),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.title!,
                                  style: TextStyle(
                                    fontSize: 23,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    letterSpacing: -0.2,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
