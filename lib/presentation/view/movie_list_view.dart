import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/status.dart';
import '../../core/util/text_styles/custom_text_style.dart';
import '../../domain/entity/movie_state.dart';
import '../bloc/movies_bloc.dart';
import '../widget/movie_info.dart';
import '../../domain/entity/movie.dart';

class MovieListView extends StatefulWidget {
  const MovieListView({
    super.key,
    required this.bloc,
  });
  final MoviesBloc bloc;

  @override
  State<MovieListView> createState() => _MovieListViewState();
}

class _MovieListViewState extends State<MovieListView> {
  static const double dividerHeight = 20;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieState>(
      initialData: widget.bloc.initialData,
      stream: widget.bloc.movies,
      builder: (
        BuildContext context,
        AsyncSnapshot<MovieState> snapshot,
      ) {
        switch (snapshot.data!.status) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case Status.success:
            List<Movie> movies = snapshot.data!.movies!;
            return ListView.separated(
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
            );
          case Status.empty:
            return const Center(
              child: Text(
                MovieDetailsUiConstants.emptyStatusMsg,
                style: CustomTextStyle.textStyleWhite,
              ),
            );
          case Status.failed:
            return Center(
              child: Text(
                snapshot.data!.errorMsg!,
                style: CustomTextStyle.textStyleWhite,
              ),
            );
        }
      },
    );
  }
}
