import 'package:hive_flutter/hive_flutter.dart';

part 'item.g.dart';

@HiveType(typeId: 2)
class Item {
  @HiveField(0)
  String title;
  @HiveField(1)
  String urlfoto;
  @HiveField(2)
  String descr;
  @HiveField(3)
  String icon;
  @HiveField(4)
  List<int> key;

  Item(
      {required this.title,
      required this.urlfoto,
      required this.descr,
      required this.icon,
      required this.key});

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['key'] = key;
  //   data['title'] = title;
  //   data['urlfoto'] = urlfoto;
  //   data['descr'] = descr;
  //   data['icon'] = icon;

  //   return data;
  // }
}
