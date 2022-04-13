import 'package:void_01/src/env/models/item/item.dart';

abstract class ItemState {
  List<Item> itens;

  ItemState({required this.itens});
}

class ItemInitialState extends ItemState {
  ItemInitialState() : super(itens: []);
}

class ItemSuccessState extends ItemState {
  ItemSuccessState({
    required List<Item> itens,
  }) : super(itens: itens);
}
