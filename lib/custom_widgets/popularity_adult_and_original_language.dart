import 'package:flutter/material.dart';
import 'middle_text.dart';

class PopularityAdultAndLanguage extends StatelessWidget {
  const PopularityAdultAndLanguage({
    super.key,
    required this.popularityValue,
    required this.adult,
    required this.originalLanguage,
  });

  static const String language = 'Language:';
  static const String popularityLabel = 'Popularity:';
  static const String adultLabel = 'Adult:';
  final num popularityValue;
  final bool adult;
  final String originalLanguage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Middle(
          text: '$language ${originalLanguage.toUpperCase()}',
        ),
        Middle(
          text: '$popularityLabel $popularityValue',
        ),
        Middle(
          text: '$adultLabel $adult',
        ),
      ],
    );
  }
}
