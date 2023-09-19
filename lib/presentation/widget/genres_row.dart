import 'package:flutter/material.dart';

import '../../core/util/enums/status.dart';
import '../../domain/entity/genre.dart';
import '../../domain/entity/genre_state.dart';
import '../../domain/usecase/implementation/get_movie_genres_usecase.dart';
import '../bloc/movie_genres_bloc.dart';
import 'row_genre_item.dart';

class Genres extends StatefulWidget {
  Genres({
    super.key,
    required this.ids,
  });

  final MovieGenresBloc movieGenresBloc = MovieGenresBloc(
    useCase: GetMovieGenresUseCase(),
  );
  final List<num> ids;
  static const noGenresFoundErrorMessage = 'No Genres for the Movie were Found';

  @override
  State<Genres> createState() => _GenresState();
}

class _GenresState extends State<Genres> {
  @override
  void initState() {
    super.initState();
    widget.movieGenresBloc.getMovieGenres(widget.ids);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<GenreState>(
      initialData: widget.movieGenresBloc.initialData,
      stream: widget.movieGenresBloc.movieGenres,
      builder: (
        BuildContext context,
        AsyncSnapshot<GenreState> snapshot,
      ) {
        switch (snapshot.data!.status) {
          case Status.loading:
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          case Status.success:
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: snapshot.data!.genres!
                  .map(
                    (genre) => RowGenreItem(
                      genre: genre.name,
                    ),
                  )
                  .toList(),
            );
          case Status.empty:
            return const Text(
              Genres.noGenresFoundErrorMessage,
            );
          case Status.failed:
            return Text(
              snapshot.data!.errorMsg!,
            );
        }
      },
    );
  }
}
