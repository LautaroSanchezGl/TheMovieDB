import 'package:flutter/material.dart';
import '../custom_widgets/popularity_adult_and_original_language.dart';

import '../custom_widgets/genres_row.dart';
import '../custom_widgets/movie_backdrop_and_title_stack.dart';
import '../custom_widgets/poster_and_overview_stack.dart';
import '../custom_widgets/release_date_and_vote_average_row.dart';
import '../entities/movie.dart';
import '../ui_constants.dart';

class MovieDetailsView extends StatelessWidget {
  const MovieDetailsView({
    super.key,
    required this.movie,
  });

  final Movie movie;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  backdrop: movie.backdropPath,
                  originalTitle: movie.originalTitle,
                ),
                ReleaseDateAndVoteAverageRow(
                  releaseDate: movie.releaseDate,
                  voteAverage: movie.voteAverage.toString(),
                  voteCount: movie.voteCount,
                ),
                PopularityAdultAndLanguage(
                  popularityValue: movie.popularity,
                  adult: movie.adult,
                  originalLanguage: movie.originalLanguage,
                ),
                const SizedBox(
                  height: MovieDetailsUiConstants.sizedBoxHeight,
                ),
                Genres(
                  genres: movie.genres,
                ),
                const SizedBox(
                  height: MovieDetailsUiConstants.sizedBoxHeight,
                ),
                PosterAndOverviewStack(
                  poster: movie.posterPath,
                  overview: movie.overview,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
