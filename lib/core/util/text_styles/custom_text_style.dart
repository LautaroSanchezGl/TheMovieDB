import 'package:flutter/material.dart';

import '../constants/ui_constants.dart';

class CustomTextStyle {
  static const TextStyle overviewTextStyleBoldWhite = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: MovieDetailsUiConstants.overviewFontSize,
    color: Colors.white70,
  );
  static const TextStyle textStyleWhite = TextStyle(
    color: Colors.white,
  );
  static const TextStyle movieTitleTextStyleBoldWhite = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: MovieDetailsUiConstants.movieTitleFontSize,
    color: Colors.white,
  );
  static const TextStyle overviewTextStyleBold = TextStyle(
    fontSize: MovieDetailsUiConstants.overviewFontSize,
    fontWeight: FontWeight.bold,
  );
}
