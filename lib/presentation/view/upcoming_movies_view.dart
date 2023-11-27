import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';

import '../bloc/movies_controller.dart';
import '../widget/custom_drawer.dart';
import 'movie_details_view.dart';

class UpcomingMoviesView extends ConsumerWidget {
  const UpcomingMoviesView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController controller = PageController();
    final state = ref.watch(moviesControllerProvider(Endpoint.upcoming));
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Center(
          child: Text(
            MovieDetailsUiConstants.upcomingMoviesLabel,
          ),
        ),
      ),
      body: state.when(
          data: (movies) => PageView(
                controller: controller,
                children: movies
                    .map(
                      (movie) => MovieDetailsView(
                        movie: movie,
                      ),
                    )
                    .toList(),
              ),
          error: (error, stacktrace) => Text('$error'),
          loading: () => const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )),
      drawer: const CustomDrawer(),
    );
  }
}
