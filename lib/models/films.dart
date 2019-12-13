import 'package:flutter/material.dart';

class Film {
  final int episodeId;
  final String name;
  final Color backgroundColor;
  final Color iconColor;

  Film(this.episodeId, this.name, this.backgroundColor, this.iconColor);
}

class FilmsModel with ChangeNotifier {
  static final _films = [
    Film(1, 'Hai Phượng', Colors.blue, Colors.white),
    Film(2, 'Bẫy Rồng', Colors.purple, Colors.white),
    Film(3, 'Em Chưa 18', Colors.red, Colors.white),
    Film(4, 'Cua Lại Vợ Bầu', Colors.yellow, Colors.black),
    Film(5, 'Trạng Quỳnh', Colors.grey, Colors.white),
    Film(6, 'Siêu Sao Siêu Ngố', Colors.blue, Colors.white),
    Film(7, 'Vu Quy Đại Náo', Colors.yellow, Colors.black),
    Film(8, 'Tháng Năm Rực Rỡ', Colors.red, Colors.white),
    Film(9, 'Cô Ba Sài Gòn', Colors.blue, Colors.white),
  ];

  List get getFilm => _films;

  int get length => _films.length;

  Film getFilmById(int id) => _films[id];
}
