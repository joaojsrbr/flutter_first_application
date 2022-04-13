import 'dart:ffi';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart';

var url = 'https://neoxscans.net/comics';

class Scraper {
  static void getData({url1}) async {
    final response = await http.get(Uri.parse(url1));
    final body = response.body;
    final html = parse(body);

    var title = html.querySelector('.main-col-inner > .item-default');
// document.querySelectorAll('[href*="href_value"]')
    print(title);
  }
}

void main() {
  Scraper.getData(url1: url);
}
