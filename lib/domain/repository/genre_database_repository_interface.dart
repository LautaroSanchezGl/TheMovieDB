import '../entity/genre.dart';

abstract class IGenreDatabaseRepository{
  Future<List<Genre>> getMovieGenres(List<int> ids);
  Future<void> addGenre(Genre genre);
}
