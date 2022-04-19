class Item {
  String? title;
  String? urlfoto;
  String? descr;
  String? icon;
  int? key;

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
