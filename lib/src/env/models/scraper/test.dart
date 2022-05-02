// // ignore_for_file: avoid_print

// import 'package:beautiful_soup_dart/beautiful_soup.dart';
// import 'package:http/http.dart' as http;

// var url = 'https://neoxscans.net/comics';

// class Scraper {
//   static void getData({url1}) async {
//     final response = await http.get(Uri.parse(url1));
//     final body = response.body;
//     // final html = parse(body);
//     // var title = html.querySelector('.main-col-inner > .item-default');
//     // document.querySelectorAll('[href*="href_value"]')

//     BeautifulSoup bs = BeautifulSoup(body);
//     final list = bs.find('div', class_: 'page-content-listing item-default');
//     final one = list!.findAll('h3', class_: 'h5');

//     print(one);
//   }
// }

// void main() {
//   Scraper.getData(url1: url);
// }


