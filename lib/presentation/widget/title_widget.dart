import 'package:flutter/material.dart';
import '../../core/util/text_styles/custom_text_style.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
    required this.movieTitle,
  });

  final String movieTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      movieTitle,
      style: CustomTextStyle.movieTitleTextStyleBoldWhite,
      textAlign: TextAlign.center,
    );
  }
}
