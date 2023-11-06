import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';

class LikeButtonCounter extends StatefulWidget {
  const LikeButtonCounter({
    super.key,
  });

  @override
  State<LikeButtonCounter> createState() => _LikeButtonCounterState();
}

class _LikeButtonCounterState extends State<LikeButtonCounter> {
  int _counter = 0;

  void increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            increaseCounter();
          },
          icon: const Icon(
            Icons.star,
            color: Colors.red,
            size: MovieDetailsUiConstants.iconSize,
          ),
          label: Text(
            '$_counter',
          ),
        ),
      ],
    );
  }
}
