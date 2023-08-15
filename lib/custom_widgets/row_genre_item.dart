import 'package:flutter/material.dart';

import '../text_styles/custom_text_style.dart';
import '../ui_constants.dart';

class RowGenreItem extends StatelessWidget {
  const RowGenreItem({super.key, required this.genre});

  final String genre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(MovieDetailsUiConstants.genreItemPadding),
      decoration: const BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(MovieDetailsUiConstants.borderRadius),
        ),
      ),
      child: Text(
        genre,
        style: CustomTextStyle.textStyleWhite,
      ),
    );
  }
}
