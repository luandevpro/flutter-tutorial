import 'dart:convert';

import "package:http/http.dart" as http;

class Posts {
  int userId;
  int id;
  String title;
  String body;

  Posts({this.userId, this.id, this.title, this.body});

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}

// fetch api
Future<List<Posts>> fetchPosts() async {
  final response = await http.get("https://jsonplaceholder.typicode.com/posts");
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((json) {
      return Posts.fromJson(json);
    }).toList();
  } else {
    throw Exception("Error");
  }
}
