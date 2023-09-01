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
      alignment: Alignment.center,
      children: [
        Image.network(
          '${MovieDetailsUiConstants.imageBaseUrl}$backdrop',
        ),
        Center(
          child: TitleWidget(
            movieTitle: originalTitle,
          ),
        ),
      ],
    );
  }
}
