import '../../core/util/enums/endpoint.dart';
import '../../domain/entity/movie.dart';
import '../../domain/repository/movie_database_repository_interface.dart';
import '../datasource/local/movie_database.dart';

class MovieDatabaseRepositoryImp extends IMovieDatabaseRepository {
  final MovieDatabase _movieDatabase;

  MovieDatabaseRepositoryImp(this._movieDatabase);

  @override
  Future<void> addMovie(movie) async {
    _movieDatabase.movieDao.insertMovie(movie);
  }

  @override
  Future<List<Movie>> getMovies({required String category}) async {
    return _movieDatabase.movieDao.getMovies(category);
  }

  @override
  Future<Movie?> existsById({required int id}) {
    return _movieDatabase.movieDao.existsById(id);
  }

  @override
  Future<void> uploadDb(
      {required Movie movie, required Endpoint endpoint}) async {
    Movie? movieInDb = await existsById(id: movie.id);
    if (movieInDb != null) {
      if (!movieInDb.categories.contains(endpoint.category)) {
        movieInDb.categories.add(endpoint.category);
        addMovie(movieInDb);
      }
    } else {
      movie.categories.add(endpoint.category);
      addMovie(movie);
    }
  }
}
