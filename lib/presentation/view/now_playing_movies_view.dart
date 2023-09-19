import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';
import '../bloc/movies_bloc.dart';
import '../widget/custom_drawer.dart';
import 'movie_list_view.dart';

class NowPlayingMoviesView extends StatefulWidget {
  const NowPlayingMoviesView({
    super.key,
    required this.bloc,
  });
  final MoviesBloc bloc;

  @override
  State<NowPlayingMoviesView> createState() => _NowPlayingMoviesViewState();
}

class _NowPlayingMoviesViewState extends State<NowPlayingMoviesView> {
  @override
  void initState() {
    widget.bloc.getMovies(Endpoint.nowPlaying);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Center(
          child: Text(
            MovieDetailsUiConstants.nowPlayingMoviesLabel,
          ),
        ),
      ),
      body: MovieListView(
        bloc: widget.bloc,
      ),
      drawer: CustomDrawer(bloc: widget.bloc),
    );
  }
}
