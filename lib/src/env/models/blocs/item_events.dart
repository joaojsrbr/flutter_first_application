import 'package:xid/xid.dart';

abstract class ItemEvent {}

class LoadItemEvent extends ItemEvent {}

class AddItemEvent extends ItemEvent {
  List key;

  AddItemEvent({
    required this.key,
  });
}

class RemoveItemEvent extends ItemEvent {
  Xid key;

  RemoveItemEvent({
    required this.key,
  });
}
