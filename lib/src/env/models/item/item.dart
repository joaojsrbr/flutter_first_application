class Item {
  String? title;
  String? urlfoto;
  String? descr;
  String? icon;

  Item({this.title, this.urlfoto, this.descr, this.icon});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlfoto = json['done'];
    descr = json['descr'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['urlfoto'] = urlfoto;
    data['descr'] = descr;
    data['icon'] = icon;
    return data;
  }
}
