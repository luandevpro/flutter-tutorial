import 'dart:convert';

import "package:http/http.dart" as http;

class Post {
  int userId;
  int id;
  String title;
  String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}

// fetch api
Future fetchPost(int id) async {
  final response =
      await http.get("https://jsonplaceholder.typicode.com/posts/${id}");
  if (response.statusCode == 200) {
    print(json.decode(response.body));
    final jsonResponse = json.decode(response.body);
    return Post.fromJson(jsonResponse);
  } else {
    throw Exception("Error");
  }
}
