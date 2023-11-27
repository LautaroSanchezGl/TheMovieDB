import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../domain/repository/genre_repository_interface.dart';
import '../datasource/remote/api_service.dart';
import '../model/data_state.dart';
import '../model/genre_model.dart';
part 'genre_repository.g.dart';

class GenreRepositoryImp implements IGenreRepository {
  final ApiService apiService;

  GenreRepositoryImp({required this.apiService});

  @override
  Future<DataState<List<GenreModel>>> getMovieGenres(List<num> ids) {
    return apiService.getGenreNamesById(ids);
  }

  @override
  Future<List<GenreModel>> getAllGenres() {
    return apiService.getAllGenres();
  }
}

@riverpod
GenreRepositoryImp genreRepositoryImp(GenreRepositoryImpRef ref){
  var apiService = ref.watch(apiServiceProvider);
  return GenreRepositoryImp(apiService: apiService);
}
