import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/enums/endpoint.dart';
import '../../core/util/text_styles/custom_text_style.dart';
import '../bloc/movies_controller.dart';

class DrawerTile extends ConsumerWidget {
  const DrawerTile({
    super.key,
    required this.title,
    required this.view,
  });

  final String title;
  final Widget view;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
