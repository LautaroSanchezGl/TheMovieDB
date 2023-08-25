import 'package:flutter/material.dart';

import '../entities/movie.dart';
import '../text_styles/custom_text_style.dart';
import '../ui_constants.dart';
import '../views/movie_details_view.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: CustomTextStyle.overviewTextStyleBoldWhite,
          ),
          Padding(
            padding: const EdgeInsets.all(
                MovieDetailsUiConstants.releaseDateRowPadding),
            child: Image.network(
              '${MovieDetailsUiConstants.imageBaseUrl}${movie.posterPath}',
            ),
          ),
        ],
      ),
    );
  }
}
