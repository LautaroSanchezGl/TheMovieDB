import '../../data/model/data_state.dart';

import '../../data/model/genre_model.dart';

abstract class IGenreRepository {
  Future<DataState<List<GenreModel>>> getMovieGenres(List<num> ids);
}
