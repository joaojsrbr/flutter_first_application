import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:void_01/src/env/models/item/item.dart';

import '../manga/widget/adapter/item_hive_adapter.dart';

class Favrepository extends ChangeNotifier {
  final List<Item> _item2 = [];

  UnmodifiableListView<Item> get itens2 => UnmodifiableListView(_item2);

  late LazyBox box;
  Favrepository() {
    _startRepository();
  }

  _startRepository() async {
    await _openBox();
    await _readFavoritas();
  }

  _readFavoritas() {
    box.keys.forEach((c) async {
      Item m = await box.get(c);
      _item2.add(m);
      notifyListeners();
    });
  }

  addItem(List<Item> key) {
    key.forEach((c) {
      if (!_item2.any((a) => a.key == c.key)) {
        _item2.add(c);
        box.put(c.title, c);
      }
    });
    notifyListeners();
  }

  _openBox() async {
    Hive.registerAdapter(ItemHiveAdapter());
    // if (!Hive.isAdapterRegistered(90)) {
    //   Hive.registerAdapter(ItemHiveAdapter());
    // }
    box = await Hive.openLazyBox<Item>('manga-Fav');
  }
}
