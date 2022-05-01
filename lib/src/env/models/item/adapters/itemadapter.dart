import 'package:hive/hive.dart';
import 'package:void_01/src/env/models/item/adapters/item.dart';

class ItemHiveAdapter extends TypeAdapter<Item> {
  @override
  final typeId = 0;

  @override
  Item read(BinaryReader reader) {
    return Item(
      title: reader.readString(),
      urlfoto: reader.readString(),
      descr: reader.readString(),
      icon: reader.readString(),
      key: reader.readIntList(),
    );
  }

  @override
  void write(BinaryWriter writer, Item obj) {
    writer.writeString(obj.title);
    writer.writeString(obj.urlfoto);
    writer.writeString(obj.descr);
    writer.writeString(obj.icon);
    writer.writeIntList(obj.key);
  }
}
