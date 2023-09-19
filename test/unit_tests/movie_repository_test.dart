import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db/core/util/enums/endpoint.dart';
import 'package:movie_db/data/datasource/remote/api_service.dart';
import 'package:movie_db/data/model/data_state.dart';
import 'package:movie_db/data/model/movie_model.dart';
import 'package:movie_db/data/repository/movie_repository.dart';
import 'package:movie_db/domain/entity/movie.dart';

import 'movie_repository_test.mocks.dart';

@GenerateMocks([
  ApiService,
])
void main() {
  MockApiService mockApiService = MockApiService();
  MovieRepositoryImp movieRepo = MovieRepositoryImp();
  movieRepo.apiService = mockApiService;
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

  test("should return a instance of DataSucces", () async {
    when(mockApiService
            .getMovies('https://api.themoviedb.org/3/movie/upcoming'))
        .thenAnswer((realInvocation) => Future.value(DataSuccess([model])));

    DataState upcomingMoviesModel =
        await movieRepo.getMovies(endpoint: Endpoint.upcoming);
    expect(upcomingMoviesModel, isInstanceOf<DataSuccess>());
  });

  test("should throw a Exception when failed", () async {
    when(mockApiService.getMovies('https://api.themoviedb.org/3/movie/popular'))
        .thenThrow(Exception('failed'));
    expect(
        () => movieRepo.getMovies(endpoint: Endpoint.popular), throwsException);
  });

  test("should return a instance of DataFailed", () async {
    when(mockApiService.getMovies('https://api.themoviedb.org/3/movie/popular'))
        .thenAnswer(
            (realInvocation) => Future.value(const DataFailed('failed')));

    DataState response = await movieRepo.getMovies(endpoint: Endpoint.popular);
    expect(response, isInstanceOf<DataFailed>());
  });
}
