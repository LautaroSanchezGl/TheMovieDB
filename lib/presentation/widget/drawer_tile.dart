import 'package:flutter/material.dart';

import '../../core/util/text_styles/custom_text_style.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.view,
  });

  final String title;
  final Widget view;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: CustomTextStyle.movieTitleTextStyleBoldWhite,
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => view,
          ),
        );
      },
    );
  }
}
