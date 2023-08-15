import 'package:flutter/material.dart';
import 'title_widget.dart';

import '../ui_constants.dart';

class MovieBackdropAndTitleStack extends StatelessWidget {
  const MovieBackdropAndTitleStack({
    super.key,
    required this.backdrop,
    required this.originalTitle,
  });

  final String backdrop;
  final String originalTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(backdrop),
        Positioned(
          bottom: MovieDetailsUiConstants.movieTitleBottomPosition,
          right: MovieDetailsUiConstants.movieTitleRightPosition,
          child: TitleWidget(
            movieTitle: originalTitle,
          ),
        ),
      ],
    );
  }
}
