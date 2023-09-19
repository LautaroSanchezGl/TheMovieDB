import 'dart:async';

import '../../core/bloc/bloc.dart';

import '../../core/util/enums/status.dart';
import '../../data/model/data_state.dart';

import '../../domain/entity/genre.dart';
import '../../domain/entity/genre_state.dart';
import '../../domain/usecase/implementation/get_movie_genres_usecase.dart';

class MovieGenresBloc implements IBloc {
  MovieGenresBloc({required this.useCase});

  final GetMovieGenresUseCase useCase;
  final _movieGenres = StreamController<GenreState>.broadcast();
  Stream<GenreState> get movieGenres => _movieGenres.stream;
  GenreState get initialData => GenreState(
        status: Status.loading,
      );

  void getMovieGenres(List<num> ids) async {
    DataState<List<Genre>> data = await useCase.call(params: ids);
    GenreState genreState = data is DataFailed
        ? GenreState(
            status: Status.failed,
            errorMsg: data.errorMsg,
          )
        : GenreState(
            status: data.data!.isEmpty ? Status.empty : Status.success,
            genres: data.data);

    _movieGenres.sink.add(genreState);
  }

  @override
  void dispose() {
    _movieGenres.close();
  }

  @override
  void initialize() {
    // TODO: implement initialize
  }
}
