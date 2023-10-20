import 'package:floor/floor.dart';

import '../../../../domain/entity/genre.dart';

@dao
abstract class GenreDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addGenre(Genre genre);

  @Query("Select * from Genre where id in (:ids)")
  Future<List<Genre>> getGenreByIds(List<int> ids);
}
