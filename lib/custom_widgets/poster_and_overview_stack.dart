import 'package:flutter/material.dart';

import '../ui_constants.dart';
import 'fav_button_counter_column.dart';
import 'movie_overview.dart';

class PosterAndOverviewStack extends StatelessWidget {
  const PosterAndOverviewStack({
    super.key,
    required this.poster,
    required this.overview,
  });

  final String poster;
  final String overview;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          '${MovieDetailsUiConstants.imageBaseUrl}$poster',
        ),
        const Positioned(
          top: MovieDetailsUiConstants.favButtonColumTopPosition,
          right: MovieDetailsUiConstants.favButtonColumnRightPosition,
          child: FavoriteButtonCounter(),
        ),
        MovieOverview(
          overview: overview,
        ),
      ],
    );
  }
}
