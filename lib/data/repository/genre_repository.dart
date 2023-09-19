import '../../domain/entity/genre.dart';
import '../../domain/repository/genre_repository_interface.dart';
import '../datasource/remote/api_service.dart';
import '../model/data_state.dart';
import '../model/genre_model.dart';

class GenreRepositoryImp implements IGenreRepository {
  ApiService apiService = ApiService();

  @override
  Future<DataState<List<GenreModel>>> getMovieGenres(List<num> ids) {
    return apiService.getGenreNamesById(ids);
  }
}
