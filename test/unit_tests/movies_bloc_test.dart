import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db/core/util/enums/endpoint.dart';
import 'package:movie_db/data/model/data_state.dart';

import 'package:movie_db/domain/entity/movie.dart';
import 'package:movie_db/domain/usecase/implementation/get_now_playing_movies_usecase.dart';
import 'package:movie_db/domain/usecase/implementation/get_movies_usecase.dart';
import 'package:movie_db/domain/usecase/implementation/get_top_rated_movies_usecase.dart';
import 'package:movie_db/domain/usecase/implementation/get_upcoming_movies_usecase.dart';
import 'package:movie_db/presentation/bloc/movies_bloc.dart';

import 'movies_bloc_test.mocks.dart';

@GenerateMocks([
  GetMoviesUseCase,GetUpcomingMoviesUseCase
])
void main() {
  MoviesBloc bloc = MoviesBloc(
      moviesUsecase: MockGetPopularMoviesUseCase(),
      nowPlayingUsecase: GetNowPlayingMoviesUseCase(),
      topRatedUsecase: GetTopRatedMoviesUseCase(),
      upcomingUsecase: MockGetUpcomingMoviesUseCase());

  test('should return false when stream is not empty', () async {
    when(bloc.moviesUsecase.call()).thenAnswer(
        (realInvocation) => Future.value(DataSuccess([Movie.mockMovie()])));

    bloc.getMovies(Endpoint.popular);

    bool empty = await bloc.movies.isEmpty;

    expect(empty, false);
  });

  test('should emit corresponding states in order', () async {
    when(bloc.moviesUsecase.call()).thenAnswer(
            (realInvocation) => Future.value(DataSuccess([Movie.mockMovie()])));
    when(bloc.upcomingUsecase.call()).thenAnswer(
            (realInvocation) => Future.value(const DataFailed('error')));

    bloc.getMovies(Endpoint.popular);
    bloc.getMovies(Endpoint.upcoming);

    expect(bloc.movies, emitsInOrder([DataSuccess([Movie.mockMovie()]), DataFailed<List<Movie>>('error')]));
  });

  test('should return true when stream is empty', () async {
    bloc.dispose();
    bool empty = await bloc.movies.isEmpty;

    expect(empty, true);
  });
}
