import 'dart:convert';

import '../../../core/util/enums/endpoint.dart';
import '../../../data/model/data_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../entity/movie.dart';
import '../../repository/movie_database_repository_interface.dart';
import '../../repository/movie_repository_interface.dart';
import '../usecase_interface.dart';

class GetMoviesUseCase implements UseCase<DataState> {
  final IMovieRepository movieRepository;
  final IMovieDatabaseRepository movieDataBaseRepository;
  static const String errorDataBase = 'data base failed';

  GetMoviesUseCase({
    required this.movieRepository,
    required this.movieDataBaseRepository,
  });

  @override
  Future<DataState<List<Movie>>> call({params}) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    Endpoint endpoint = params;
    if (connectivityResult == ConnectivityResult.none) {
      List<Movie> movies =
          await movieDataBaseRepository.getMovies(category: endpoint.category);
      return DataSuccess(movies);
    } else {
      DataState<List<Movie>> movies =
          await movieRepository.getMovies(endpoint: endpoint);
      for (var movie in movies.data!) {
        movieDataBaseRepository.uploadDb(movie: movie, endpoint: endpoint);
      }
      return movies;
    }
  }

  Future<DataState<List<Movie>>> getFavoriteMovies(
      {required List<int> moviesId}) async {
    DataState<List<Movie>> favoriteMovies =
        await movieRepository.getFavoriteMovies(moviesId: moviesId);
    return favoriteMovies;
  }
}
