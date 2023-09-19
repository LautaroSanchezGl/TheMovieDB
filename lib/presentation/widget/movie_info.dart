import 'package:flutter/material.dart';

import '../../domain/entity/movie.dart';

import '../../core/util/constants/ui_constants.dart';
import '../view/movie_details_view.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetailsView(
              movie: movie,
            ),
          ),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.all(MovieDetailsUiConstants.releaseDateRowPadding),
        child: Image.network(
          '${MovieDetailsUiConstants.imageBaseUrl}${movie.posterPath}',
        ),
      ),
    );
  }
}
