import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';

import '../../core/util/enums/status.dart';

import '../../core/util/text_styles/custom_text_style.dart';
import '../../domain/entity/movie_state.dart';
import '../bloc/movies_bloc.dart';
import '../widget/custom_drawer.dart';
import '../widget/movie_info.dart';

class MoviesGridView extends StatefulWidget {
  const MoviesGridView({
    super.key,
    required this.bloc,
    required this.endpoint,
    required this.title,
  });

  final MoviesBloc bloc;
  final Endpoint? endpoint;
  final String title;
  @override
  State<MoviesGridView> createState() => _MoviesGridViewState();
}

class _MoviesGridViewState extends State<MoviesGridView> {
  static const int crossAxisCount = 2;
  static const double childAspectRatio = 0.7;
  static const double mainAxisSpacing = 5;
  static const String moviesGridViewScaffoldKey = 'moviesGridViewScaffoldKey';

  @override
  void initState() {
    widget.endpoint == null
        ? widget.bloc.getFavoriteMovies()
        : widget.bloc.getMovies(widget.endpoint!);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MoviesGridView oldWidget) {
    widget.bloc.getMovies(widget.endpoint!);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key(moviesGridViewScaffoldKey),
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: StreamBuilder<MovieState>(
        initialData: widget.bloc.initialData,
        stream: widget.endpoint == null
            ? widget.bloc.favoriteMovies
            : widget.bloc.movies,
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
              return GridView.builder(
                  itemCount: snapshot.data!.movies!.length,
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
                      key:
                          Key('${MovieDetailsUiConstants.movieKeyLabel}$index'),
                      movie: snapshot.data!.movies![index],
                    );
                  });
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
