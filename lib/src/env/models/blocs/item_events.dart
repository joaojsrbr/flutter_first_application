import 'package:void_01/src/env/models/item/item.dart';

abstract class ItemEvent {}

class LoadItemEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  Item item;

  AddItemEvent({
    required this.item,
  });
}

class RemoveItemEvent extends ItemEvent {
  Item title;
  Item urlfoto;
  Item icon;
  Item descr;

  RemoveItemEvent(
      {required this.title,
      required this.icon,
      required this.urlfoto,
      required this.descr});
}
