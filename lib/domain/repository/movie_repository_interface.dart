import '../../data/model/data_state.dart';

import '../../data/model/movie_model.dart';

abstract class IMovieRepository {
  Future<DataState<List<MovieModel>>> getMovies(
      {required Map<String, dynamic> params});
}
