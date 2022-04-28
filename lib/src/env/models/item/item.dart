class Item {
  String title;
  String urlfoto;
  String descr;
  String icon;
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
