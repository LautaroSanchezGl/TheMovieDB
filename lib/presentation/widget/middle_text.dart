import 'package:flutter/material.dart';
import '../../core/util/text_styles/custom_text_style.dart';

class Middle extends StatelessWidget {
  const Middle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: CustomTextStyle.overviewTextStyleBold,
    );
  }
}
