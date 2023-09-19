import '../../core/util/enums/endpoint.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_repository_interface.dart';

import '../datasource/remote/api_service.dart';
import '../model/data_state.dart';
import '../model/movie_model.dart';

class MovieRepositoryImp implements IMovieRepository {
  ApiService apiService = ApiService();

  static const String baseUrl = 'https://api.themoviedb.org/3/movie/';
  static const String topRated = 'top_rated';
  static const String popular = 'popular';
  static const String nowPlaying = 'now_playing';
  static const String upcoming = 'upcoming';

  @override
  Future<DataState<List<MovieModel>>> getMovies({required Endpoint endpoint}) {
    switch (endpoint) {
      case Endpoint.popular:
        return apiService.getMovies('$baseUrl$popular');
      case Endpoint.nowPlaying:
        return apiService.getMovies('$baseUrl$nowPlaying');
      case Endpoint.topRated:
        return apiService.getMovies('$baseUrl$topRated');
      case Endpoint.upcoming:
        return apiService.getMovies('$baseUrl$upcoming');
    }
  }
}
