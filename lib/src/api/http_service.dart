import 'dart:convert';

import 'package:http/http.dart';

import 'post_model.dart';

class HttpService {
  final String postUrl =
      "https://api-discord-app-jsr.herokuapp.com/api/v1/message";
  Future<List<Post>> getPosts() async {
    Response res = await get(Uri.parse(postUrl));

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      // ignore: non_constant_identifier_names
      List<Post> Posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return Posts;
    } else {
      throw "Error";
    }
  }
}
