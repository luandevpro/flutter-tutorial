import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/films.dart';
import 'package:fluttertutorial/widgets/film_item.dart';
import 'package:provider/provider.dart';

class FilmsPage extends StatelessWidget {
  const FilmsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final films = Provider.of<FilmsModel>(context);
    print(films.getFilm[0].name);
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: films.length,
        itemBuilder: (BuildContext context, int index) {
          return ListItem(index);
        },
      ),
    );
  }
}
