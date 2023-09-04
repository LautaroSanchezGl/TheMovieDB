import '../entity/genre.dart';

abstract class IGenreRepository{
  Future<List<Genre>> getGenreNamesById(List<num> ids);
}
