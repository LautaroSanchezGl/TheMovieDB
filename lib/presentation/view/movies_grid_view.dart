import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';

import '../bloc/movies_controller.dart';
import '../widget/custom_drawer.dart';
import '../widget/movie_info.dart';

class MoviesGridView extends ConsumerWidget {
  const MoviesGridView({
    super.key,
    required this.endpoint,
    required this.title,
  });

  final Endpoint endpoint;
  final String title;
  static const int crossAxisCount = 2;
  static const double childAspectRatio = 0.7;
  static const double mainAxisSpacing = 5;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(moviesControllerProvider(endpoint));
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Center(
          child: Text(
            title,
          ),
        ),
      ),
      body: state.when(
        data: (movies) => movies.isNotEmpty
            ? GridView.builder(
                itemCount: movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  mainAxisSpacing: mainAxisSpacing,
                ),
                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  return MovieInfo(
                    key: Key('${MovieDetailsUiConstants.movieKeyLabel}$index'),
                    movie: movies![index],
                  );
                })
            : const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sentiment_dissatisfied,
                      color: Colors.white,
                    ),
                    Text(
                      'There are no movies to display',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
        error: (error, stacktrace) => Text('$error'),
        loading: () => const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      drawer: const CustomDrawer(),
    );
  }
}
