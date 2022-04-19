import 'package:void_01/src/env/models/item/item.dart';
import 'package:xid/xid.dart';

abstract class ItemEvent {}

class LoadItemEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  Item item;

  AddItemEvent({
    required this.item,
  });
}

class RemoveItemEvent extends ItemEvent {
  Xid key;

  RemoveItemEvent({
    required this.key,
  });
}
