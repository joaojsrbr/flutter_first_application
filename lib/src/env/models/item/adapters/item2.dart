import 'package:hive/hive.dart';

part 'item2.g.dart';

@HiveType(typeId: 1)
class Item2 {
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

  Item2(
      {required this.descr,
      required this.icon,
      required this.key,
      required this.title,
      required this.urlfoto});
}
