import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/constants/ui_constants.dart';

import '../../core/util/enums/endpoint.dart';
import '../bloc/movies_controller.dart';
import '../widget/movie_info.dart';

class MovieListView extends ConsumerWidget {
  const MovieListView({
    super.key,
  });

  static const double dividerHeight = 20;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(moviesControllerProvider(Endpoint.nowPlaying));
    return Scaffold(
      backgroundColor: Colors.black12,
      body: state.when(
        data: (movies) => ListView.separated(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return MovieInfo(
              key: Key('${MovieDetailsUiConstants.movieKeyLabel}$index'),
              movie: movies[index],
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: dividerHeight,
            );
          },
        ),
        error: (error, stacktrace) => Text('$error'),
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
