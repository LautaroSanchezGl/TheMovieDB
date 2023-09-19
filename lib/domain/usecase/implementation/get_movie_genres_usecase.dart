import '../../../data/model/data_state.dart';

import '../../../data/repository/genre_repository.dart';
import '../../entity/genre.dart';
import '../../repository/genre_repository_interface.dart';
import '../usecase_interface.dart';

class GetMovieGenresUseCase implements UseCase<DataState> {
  IGenreRepository genreRepository = GenreRepositoryImp();

  @override
  Future<DataState<List<Genre>>> call({params}) {
    return genreRepository.getMovieGenres(params);
  }
}
