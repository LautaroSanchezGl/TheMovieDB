import 'package:flutter/material.dart';
import '../entities/genre.dart';
import '../repositories/genre_repository.dart';
import 'row_genre_item.dart';

class Genres extends StatefulWidget {
  const Genres({
    super.key,
    required this.genres,
  });

  final List<num> genres;
  static const errorMessage = 'error while loading genres';

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  final GenreRepository genreRepository = GenreRepository();
  late Future<List<Genre>> genres;

  @override
  void initState() {
    super.initState();
    genres = genreRepository.getGenreNamesById(widget.genres);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genres,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Genre>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
        if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: snapshot.data!
                .map(
                  (genre) => RowGenreItem(
                    genre: genre.name,
                  ),
                )
                .toList(),
          );
        } else {
          return const Text(
            Genres.errorMessage,
          );
        }
      },
    );
  }
}
