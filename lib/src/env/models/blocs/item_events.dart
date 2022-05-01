import 'package:void_01/src/env/models/item/adapters/item.dart';

abstract class ItemEvent {}

class LoadItemEvent extends ItemEvent {}

class LoadItemEvent2 extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  List<Item> key;

  AddItemEvent({
    required this.key,
  });
}

class RemoveItemEvent extends ItemEvent {
  List<int> key;

  RemoveItemEvent({
    required this.key,
  });
}
