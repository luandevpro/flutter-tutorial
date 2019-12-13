import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/faves.dart';
import 'package:fluttertutorial/models/films.dart';
import 'package:fluttertutorial/pages/faves_page.dart';
import 'package:fluttertutorial/pages/films_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(Application());

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _currentPage = 0;
  final _appBarTitle = [
    Text("Films"),
    Text("Faves"),
  ];
  final _optionPages = [
    FilmsPage(),
    FavesPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FilmsModel>(
          create: (_) => FilmsModel(),
        ),
        ChangeNotifierProxyProvider<FilmsModel, FavesModel>(
          builder: (context, films, previousFaves) =>
              FavesModel(films, previousFaves),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: _appBarTitle[_currentPage],
            backgroundColor: Colors.indigo,
          ),
          body: _optionPages[_currentPage],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentPage,
            items: [
              BottomNavigationBarItem(
                title: Text("Films"),
                icon: Icon(Icons.movie),
              ),
              BottomNavigationBarItem(
                title: Text("Faves"),
                icon: Icon(Icons.star),
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentPage = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
