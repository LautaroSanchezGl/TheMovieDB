import 'dart:async';

import '../../core/bloc/bloc.dart';
import '../../core/util/enums/endpoint.dart';
import '../../core/util/enums/status.dart';
import '../../data/model/data_state.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_state.dart';
import '../../domain/usecase/implementation/get_movies_usecase.dart';


class MoviesBloc implements IBloc {
  MoviesBloc({
    required this.moviesUsecase,
  });

  final GetMoviesUseCase moviesUsecase;

  final _movies = StreamController<MovieState>.broadcast();
  Stream<MovieState> get movies => _movies.stream;
  MovieState get initialData => MovieState(
        status: Status.loading,
      );

  void getMovies(Endpoint endpoint) async {
    DataState<List<Movie>> data = await moviesUsecase.call(params: endpoint);

    MovieState movieState = data is DataFailed
        ? MovieState(
            status: Status.failed,
            errorMsg: data.errorMsg,
          )
        : MovieState(
            status: data.data!.isEmpty ? Status.empty : Status.success,
            movies: data.data,
          );

    _movies.sink.add(movieState);
  }

  @override
  void dispose() {
    _movies.close();
  }

  @override
  void initialize() {
    // TODO: implement initialize
  }
}
