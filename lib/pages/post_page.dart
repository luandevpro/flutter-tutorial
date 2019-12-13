import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/post.dart';

class PostPage extends StatelessWidget {
  final int id;

  // const PostPage(this.id, {Key key}) : super(key: key);
  const PostPage(this.id, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPost(id),
      builder: (ctx, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        if (snapshot.hasData) {
          print(snapshot.data.title);
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "${snapshot.data.title}",
                style: TextStyle(fontSize: 20),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "${snapshot.data.body}",
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
