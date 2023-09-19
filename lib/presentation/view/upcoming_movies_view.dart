import 'package:flutter/material.dart';
import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';
import '../../core/util/enums/status.dart';

import '../../core/util/text_styles/custom_text_style.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_state.dart';
import '../bloc/movies_bloc.dart';
import '../widget/custom_drawer.dart';
import 'movie_details_view.dart';

class UpcomingMoviesView extends StatefulWidget {
  const UpcomingMoviesView({
    super.key,
    required this.bloc,
  });

  final MoviesBloc bloc;
  @override
  State<UpcomingMoviesView> createState() => _UpcomingMoviesViewState();
}

class _UpcomingMoviesViewState extends State<UpcomingMoviesView> {
  final PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    widget.bloc.getMovies(Endpoint.upcoming);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: const Center(
          child: Text(
            MovieDetailsUiConstants.upcomingMoviesLabel,
          ),
        ),
      ),
      body: StreamBuilder<MovieState>(
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
              return PageView(
                controller: controller,
                children: snapshot.data!.movies!
                    .map(
                      (movie) => MovieDetailsView(
                        movie: movie,
                      ),
                    )
                    .toList(),
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
      ),
      drawer: CustomDrawer(
        bloc: widget.bloc,
      ),
    );
  }
}
