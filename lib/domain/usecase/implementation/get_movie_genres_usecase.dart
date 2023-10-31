import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../data/model/data_state.dart';

import '../../../data/repository/genre_repository.dart';
import '../../entity/genre.dart';
import '../../repository/genre_database_repository_interface.dart';
import '../../repository/genre_repository_interface.dart';
import '../usecase_interface.dart';

class GetMovieGenresUseCase implements UseCase<DataState> {
  IGenreRepository genreRepository = GenreRepositoryImp();
  IGenreDatabaseRepository genreDatabaseRepository;

  GetMovieGenresUseCase({
    required this.genreDatabaseRepository,
  });

  @override
  Future<DataState<List<Genre>>> call({params}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      List<Genre> genres = await genreDatabaseRepository.getMovieGenres(params);
      return DataSuccess(genres);
    } else {
      _saveAllGenresInDataBase();
      DataState<List<Genre>> genres =
          await genreRepository.getMovieGenres(params);
      return genres;
    }
  }

  Future<void> _saveAllGenresInDataBase() async {
    List<Genre> genres = await genreRepository.getAllGenres();
    for (var genre in genres) {
      genreDatabaseRepository.addGenre(genre);
    }
  }
}
