import 'package:void_01/src/env/models/item/item.dart';

abstract class ItemState {
  List<Item>? itens;

  ItemState({this.itens});
}

class ItemInitialState extends ItemState {
  ItemInitialState() : super(itens: []);
}

class ItemSuccessState extends ItemState {
  ItemSuccessState({List<Item>? itens}) : super(itens: itens);
}

// class Item2SuccessState extends ItemState {
//   Item2SuccessState({required List? itens2}) : super(itens2: itens2);
// }
