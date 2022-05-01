import 'package:void_01/src/env/models/item/adapters/item.dart';

abstract class ItemState {
  List<Item>? itens;
  List<Item>? itens2;
  ItemState({this.itens, this.itens2});
}

class ItemInitialState extends ItemState {
  ItemInitialState() : super(itens: []);
}

class ItemSuccessState extends ItemState {
  ItemSuccessState({List<Item>? itens, List<Item>? itens2})
      : super(itens: itens, itens2: itens2);
}
