import 'package:flutter/material.dart';

import '../ui_constants.dart';
import 'middle_text.dart';

class ReleaseDateAndVoteAverageRow extends StatelessWidget {
  const ReleaseDateAndVoteAverageRow({
    super.key,
    required this.releaseDate,
    required this.voteAverage,
  });

  final String releaseDate;
  final String voteAverage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(MovieDetailsUiConstants.releaseDateRowPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Middle(
              text:
                  '${MovieDetailsUiConstants.releaseDateTextConstant} $releaseDate'),
          Middle(text: voteAverage),
        ],
      ),
    );
  }
}
