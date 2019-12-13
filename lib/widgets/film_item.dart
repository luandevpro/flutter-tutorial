import 'package:flutter/material.dart';
import 'package:fluttertutorial/models/films.dart';
import 'package:fluttertutorial/widgets/fave_button.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final int index;

  const ListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final film = Provider.of<FilmsModel>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: film.getFilmById(index).backgroundColor,
          child: Text("${index + 1}"),
        ),
        title: Text("${film.getFilmById(index).name}"),
        trailing: FaveButton(film: film.getFilmById(index)),
      ),
    );
  }
}
