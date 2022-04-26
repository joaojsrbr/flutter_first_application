import 'package:xid/xid.dart';

class Item2 {
  dynamic list;
  Xid? key;
  Item2({this.list, this.key});
  Item2.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    list = json['list'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['list'] = list;

    return data;
  }
}

class Item {
  String? title;
  String? urlfoto;
  String? descr;
  String? icon;
  Xid? key;

  Item({this.title, this.urlfoto, this.descr, this.icon, this.key});

  Item.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    title = json['title'];
    urlfoto = json['done'];
    descr = json['descr'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['key'] = key;
    data['title'] = title;
    data['urlfoto'] = urlfoto;
    data['descr'] = descr;
    data['icon'] = icon;

    return data;
  }
}
