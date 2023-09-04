import '../entity/movie.dart';

abstract class IMovieRepository {
  Future<List<Movie>> getMovies();
}
