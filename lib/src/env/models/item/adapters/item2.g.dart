// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item2.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Item2Adapter extends TypeAdapter<Item2> {
  @override
  final int typeId = 1;

  @override
  Item2 read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Item2(
      descr: fields[2] as String,
      icon: fields[3] as String,
      key: (fields[4] as List).cast<int>(),
      title: fields[0] as String,
      urlfoto: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Item2 obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.urlfoto)
      ..writeByte(2)
      ..write(obj.descr)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.key);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item2Adapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
