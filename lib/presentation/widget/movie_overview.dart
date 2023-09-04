import 'package:flutter/material.dart';

import '../../core/util/text_styles/custom_text_style.dart';
import '../../core/util/constants/ui_constants.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({
    super.key,
    required this.overview,
  });

  final String overview;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: MovieDetailsUiConstants.overviewPadding,
        horizontal: MovieDetailsUiConstants.releaseDateRowPadding,
      ),
      child: Text(
        overview,
        style: CustomTextStyle.overviewTextStyleBoldWhite,
      ),
    );
  }
}
