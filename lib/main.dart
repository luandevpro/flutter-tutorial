import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/post.dart';
import 'package:fluttertutorial/pages/post_page.dart';

void main() => runApp(Application());

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("API Tutorial"),
          backgroundColor: Colors.indigo,
        ),
        body: FutureBuilder(
          future: fetchPosts(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (ctx, index) {
                  return ListTile(
                    title: Text(
                      "${snapshot.data[index].title}",
                      style: TextStyle(fontSize: 20),
                    ),
                    leading: CircleAvatar(
                      child: Text("${snapshot.data[index].id}"),
                    ),
                    onTap: () {
                      Navigator.push(
                        ctx,
                        MaterialPageRoute(
                          builder: (ctx) => PostPage(snapshot.data[index].id),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
