import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:void_01/src/env/models/blocs/Item_events.dart';
import 'package:void_01/src/env/models/item/item.dart';
import 'package:xid/xid.dart';

import '../../../../../theme/dark_theme_provider.dart';

class AnimatedDetailGridView extends StatefulWidget {
  final double percent;
  final String title;
  final dynamic itens;
  final VoidCallback? onPressed;
  final dynamic controllerdrag;
  final dynamic scrollController;
  final bool isSelected;
  final dynamic bloc;
  const AnimatedDetailGridView({
    required this.itens,
    this.onPressed,
    required this.percent,
    required this.title,
    required this.bloc,
    required this.controllerdrag,
    required this.scrollController,
    required this.isSelected,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedDetailGridView> createState() => _AnimatedDetailGridViewState();
}

class _AnimatedDetailGridViewState extends State<AnimatedDetailGridView> {
  List<Item2> fav = [];
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

  void onPressed(selectedindex) {
    setState(
      () {
        selectedindex.forEach(
          (element) {
            widget.bloc.add(
              RemoveItemEvent(
                key: element,
              ),
            );
          },
        );
        widget.controllerdrag.clear();
      },
    );
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
    assert(debugCheckHasMaterialLocalizations(context));

    const _toptext = 50.0;

    final _currentsizetest =
        (_toptext * (1.0 - widget.percent)).clamp(35.0, _toptext);

    final _themeChange = Provider.of<DarkThemeProvider>(context);

    addonPressed() {
      setState(
        () {
          final _keys = widget.controllerdrag.value.selectedIndexes
              .map<dynamic>((index) => widget.itens[index]);
          _keys.forEach((element) {
            fav.add(Item2(key: Xid(), list: element));
          });
          widget.controllerdrag.clear();
        },
      );
      print(fav);
    }

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
                            top: _currentsizetest,
                            left: 10,
                            right: 2,
                            key: const Key('selecting'),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widget.controllerdrag.value.isSelecting
                                    ? IconButton(
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
                                    style: const TextStyle(
                                      fontSize: 20,
                                      letterSpacing: -0.2,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    addonPressed();
                                    _themeChange.stringPreference.setstring([
                                      fav[0].list.title,
                                      fav[0].list.urlfoto,
                                      fav[0].list.descr
                                    ]);
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete_outline),
                                  onPressed: () {
                                    final key = widget
                                        .controllerdrag.value.selectedIndexes
                                        .map<dynamic>(
                                            (index) => widget.itens[index].key);
                                    onPressed(key);
                                  },
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
                                  widget.title,
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
                          )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
