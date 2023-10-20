import '../../domain/entity/genre.dart';
import '../../domain/repository/genre_database_repository_interface.dart';
import '../datasource/local/movie_database.dart';

class GenreDatabaseRepositoryImp extends IGenreDatabaseRepository {
  final MovieDatabase _movieDatabase;

  GenreDatabaseRepositoryImp(this._movieDatabase);

  @override
  Future<void> addGenre(Genre genre) async {
    _movieDatabase.genreDao.addGenre(genre);
  }

  @override
  Future<List<Genre>> getMovieGenres(List<int> ids) async {
    return _movieDatabase.genreDao.getGenreByIds(ids);
  }
}
