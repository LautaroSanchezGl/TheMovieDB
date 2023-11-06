import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';
import '../../domain/repository/movie_repository_interface.dart';

import '../datasource/remote/api_service.dart';
import '../model/data_state.dart';
import '../model/movie_model.dart';

class MovieRepositoryImp implements IMovieRepository {
  final ApiService apiService;

  MovieRepositoryImp({
    required this.apiService,
  });

  static const String topRated = 'top_rated';
  static const String popular = 'popular';
  static const String nowPlaying = 'now_playing';
  static const String upcoming = 'upcoming';

  @override
  Future<DataState<List<MovieModel>>> getMovies(
      {required Map<String, dynamic> params}) {
    Endpoint endpoint = params['endpoint'];
    switch (endpoint) {
      case Endpoint.popular:
        return apiService
            .getMovies('${MovieDetailsUiConstants.baseUrl}$popular');
      case Endpoint.nowPlaying:
        return apiService
            .getMovies('${MovieDetailsUiConstants.baseUrl}$nowPlaying');
      case Endpoint.topRated:
        return apiService
            .getMovies('${MovieDetailsUiConstants.baseUrl}$topRated');
      case Endpoint.upcoming:
        return apiService
            .getMovies('${MovieDetailsUiConstants.baseUrl}$upcoming');
      case Endpoint.favorites:
        final movieIds = List<int>.from(params['movieIds']);
        return apiService.getMoviesByIds(movieIds);
    }
  }
}
