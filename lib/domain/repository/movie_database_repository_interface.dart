import '../../core/util/enums/endpoint.dart';
import '../entity/movie.dart';

abstract class IMovieDatabaseRepository {
  Future<List<Movie>> getMovies({required String category});
  Future<void> addMovie(Movie movie);
  Future<Movie?> existsById({required int id});
  Future<void> uploadDb({required Movie movie, required Endpoint endpoint});
}
