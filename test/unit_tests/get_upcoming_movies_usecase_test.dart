import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db/core/util/enums/endpoint.dart';
import 'package:movie_db/data/model/data_state.dart';
import 'package:movie_db/data/model/movie_model.dart';
import 'package:movie_db/data/repository/movie_repository.dart';
import 'package:movie_db/domain/usecase/implementation/get_upcoming_movies_usecase.dart';

import 'get_popular_movies_usecase_test.mocks.dart';

@GenerateMocks([
  MovieRepositoryImp,
])
void main() {
  MockMovieRepositoryImp mockMovieRepository = MockMovieRepositoryImp();
  MovieModel model = MovieModel(
    adult: false,
    backdropPath: 'backdropPath',
    genreIds: [],
    id: 3,
    originalLanguage: 'originalLanguage',
    originalTitle: 'originalTitle',
    overview: 'overview',
    popularity: 1,
    posterPath: 'posterPath',
    releaseDate: 'releaseDate',
    title: 'title',
    video: false,
    voteAverage: 1,
    voteCount: 1,
  );

  test("should return instance of DataSuccess", () async {
    when(mockMovieRepository.getMovies(endpoint: Endpoint.upcoming))
        .thenAnswer((realInvocation) => Future.value(
              DataSuccess([model]),
            ));
    GetUpcomingMoviesUseCase getUpcomingMoviesUseCase =
        GetUpcomingMoviesUseCase();
    getUpcomingMoviesUseCase.movieRepository = mockMovieRepository;
    DataState data = await getUpcomingMoviesUseCase.call();
    expect(data, isA<DataSuccess>());
  });

  test("should return instance of DataFailed", () async {
    when(mockMovieRepository.getMovies(endpoint: Endpoint.upcoming))
        .thenAnswer((realInvocation) => Future.value(
              const DataFailed('error'),
            ));
    GetUpcomingMoviesUseCase getUpcomingMoviesUseCase =
        GetUpcomingMoviesUseCase();
    getUpcomingMoviesUseCase.movieRepository = mockMovieRepository;
    DataState data = await getUpcomingMoviesUseCase.call();
    expect(data, isA<DataFailed>());
  });
}
