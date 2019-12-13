import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/faves.dart';
import 'package:fluttertutorial/widgets/film_item.dart';
import 'package:provider/provider.dart';

class FavesPage extends StatelessWidget {
  const FavesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final films = Provider.of<FavesModel>(context);
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
