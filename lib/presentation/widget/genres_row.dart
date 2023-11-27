import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/movie_genres_controller.dart';
import 'row_genre_item.dart';

class Genres extends ConsumerWidget {
  const Genres({
    super.key,
    required this.ids,
  });

  final List<int> ids;
  static const noGenresFoundErrorMessage = 'No Genres for the Movie were Found';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(movieGenresControllerProvider(ids));
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: state.when(
        data: (genres) => genres
            .map(
              (genre) => RowGenreItem(
                genre: genre.name,
              ),
            )
            .toList(),
        error: (error, stacktrace) => [Text('$error')],
        loading: () => [
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
