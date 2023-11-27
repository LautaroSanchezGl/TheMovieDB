import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';

import '../bloc/movies_controller.dart';
import '../widget/custom_drawer.dart';
import 'movie_list_view.dart';

class NowPlayingMoviesView extends ConsumerWidget {
  const NowPlayingMoviesView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Center(
          child: Text(
            MovieDetailsUiConstants.nowPlayingMoviesLabel,
          ),
        ),
      ),
      body: const MovieListView(),
      drawer: const CustomDrawer(),
    );
  }
}
