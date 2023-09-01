import 'package:flutter/material.dart';

import '../custom_widgets/movie_info.dart';
import '../repositories/movie_repository.dart';
import '../entities/movie.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({super.key});

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  final MovieRepository movieRepository = MovieRepository();
  late Future<List<Movie>> movies;
  static const double dividerHeight = 20;
  static const String errorMessage = 'An error has occurred while loading data';

  @override
  void initState() {
    super.initState();
    movies = movieRepository.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movies,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<Movie>> snapshot,
      ) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        } else if (snapshot.hasData) {
          List<Movie> movies = snapshot.data ?? [];
          return ListView.separated(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieInfo(movie: movies[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: dividerHeight,
              );
            },
          );
        }
        return const Text(
          errorMessage,
        );
      },
    );
  }
}
