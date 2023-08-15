import 'package:flutter/material.dart';
import 'row_genre_item.dart';

class Genres extends StatelessWidget {
  const Genres({
    super.key,
    required this.genres,
  });

  final List<String> genres;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: genres
          .map(
            (genre) => RowGenreItem(genre: genre),
          )
          .toList(),
    );
  }
}
