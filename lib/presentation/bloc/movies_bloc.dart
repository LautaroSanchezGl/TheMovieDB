import 'dart:async';

import '../../core/bloc/bloc.dart';
import '../../core/util/enums/endpoint.dart';
import '../../core/util/enums/status.dart';
import '../../data/model/data_state.dart';
import '../../domain/entity/movie.dart';
import '../../domain/entity/movie_state.dart';
import '../../domain/usecase/implementation/get_now_playing_movies_usecase.dart';
import '../../domain/usecase/implementation/get_popular_movies_usecase.dart';
import '../../domain/usecase/implementation/get_top_rated_movies_usecase.dart';
import '../../domain/usecase/implementation/get_upcoming_movies_usecase.dart';

class MoviesBloc implements IBloc {
  MoviesBloc({
    required this.popularUsecase,
    required this.nowPlayingUsecase,
    required this.topRatedUsecase,
    required this.upcomingUsecase,
  });

  final GetPopularMoviesUseCase popularUsecase;
  final GetNowPlayingMoviesUseCase nowPlayingUsecase;
  final GetTopRatedMoviesUseCase topRatedUsecase;
  final GetUpcomingMoviesUseCase upcomingUsecase;

  final _movies = StreamController<MovieState>.broadcast();
  Stream<MovieState> get movies => _movies.stream;
  MovieState get initialData => MovieState(
        status: Status.loading,
      );

  void getMovies(Endpoint endpoint) async {
    DataState<List<Movie>> data;
    switch (endpoint) {
      case Endpoint.popular:
        data = await popularUsecase.call();
      case Endpoint.nowPlaying:
        data = await nowPlayingUsecase.call();
      case Endpoint.topRated:
        data = await topRatedUsecase.call();
      case Endpoint.upcoming:
        data = await upcomingUsecase.call();
    }

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
