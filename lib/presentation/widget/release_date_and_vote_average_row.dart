import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';
import 'middle_text.dart';

class ReleaseDateAndVoteAverageRow extends StatelessWidget {
  const ReleaseDateAndVoteAverageRow({
    super.key,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  final String releaseDate;
  final String voteAverage;
  final num voteCount;

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
                '${MovieDetailsUiConstants.releaseDateTextConstant} $releaseDate',
          ),
          Middle(
            text: voteAverage,
          ),
          Middle(
            text: voteCount.toString(),
          ),
        ],
      ),
    );
  }
}
