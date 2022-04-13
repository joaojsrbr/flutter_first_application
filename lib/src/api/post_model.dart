// ignore: camel_case_types
class Post {
  final int id;
  final String message;
  final String urlfoto;

  Post({required this.id, required this.message, required this.urlfoto});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      message: json['message'] as String,
      urlfoto: json['urlfoto'] as String,
    );
  }
}
