import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';

import 'fav_button.dart';
import 'fav_button_counter_column.dart';
import 'movie_overview.dart';

class PosterAndOverviewStack extends StatelessWidget {
  const PosterAndOverviewStack({
    super.key,
    required this.poster,
    required this.overview,
    required this.title,
    required this.id,
  });

  final String poster;
  final String overview;
  final String title;
  final int id;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          '${MovieDetailsUiConstants.imageBaseUrl}$poster',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FavButton(
              title: title,
              id: id,
            ),
            const LikeButtonCounter(),
          ],
        ),
        MovieOverview(
          overview: overview,
        ),
      ],
    );
  }
}
