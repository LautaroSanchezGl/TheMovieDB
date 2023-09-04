import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';

class FavoriteButtonCounter extends StatefulWidget {
  const FavoriteButtonCounter({
    super.key,
  });

  @override
  State<FavoriteButtonCounter> createState() => _FavoriteButtonCounterState();
}

class _FavoriteButtonCounterState extends State<FavoriteButtonCounter> {
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
            Icons.favorite_outlined,
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
