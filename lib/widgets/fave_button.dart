import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/faves.dart';
import 'package:fluttertutorial/models/films.dart';
import 'package:provider/provider.dart';

class FaveButton extends StatelessWidget {
  final Film film;

  const FaveButton({Key key, @required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var faves = Provider.of<FavesModel>(context);
    return FlatButton(
      onPressed: faves.films.contains(film)
          ? () => faves.remove(film)
          : () => faves.add(film),
      splashColor: Theme.of(context).primaryColor,
      child: faves.films.contains(film)
          ? Icon(Icons.star)
          : Icon(Icons.star_border),
    );
  }
}
