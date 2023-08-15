import 'package:flutter/material.dart';

import 'custom_widgets/genres_row.dart';
import 'custom_widgets/poster_and_overview_stack.dart';
import 'custom_widgets/release_date_and_vote_average_row.dart';
import 'custom_widgets/movie_backdrop_and_title_stack.dart';
import 'entities/movie.dart';
import 'ui_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Movie movie = Movie.mockMovie();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black12,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Text(
            movie.title,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  MovieBackdropAndTitleStack(
                    backdrop: movie.backdrop,
                    originalTitle: movie.originalTitle,
                  ),
                  ReleaseDateAndVoteAverageRow(
                    releaseDate: movie.releaseDate,
                    voteAverage: movie.voteAverage,
                  ),
                  Genres(
                    genres: movie.genres,
                  ),
                  const SizedBox(
                    height: MovieDetailsUiConstants.sizedBoxHeight,
                  ),
                  PosterAndOverviewStack(
                    poster: movie.poster,
                    overview: movie.overview,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
