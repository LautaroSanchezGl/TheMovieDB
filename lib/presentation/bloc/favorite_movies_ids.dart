import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'favorite_movies_ids.g.dart';

@Riverpod(keepAlive: true)
class FavoriteMoviesIds extends _$FavoriteMoviesIds {
  List<int> favoriteMoviesIds = [];

  @override
  List<int> build() {
    return favoriteMoviesIds;
  }

  void addToFavorite({required int movieId}) {
    favoriteMoviesIds.add(movieId);
  }

  void removeFromFavorite({required int movieId}) {
    favoriteMoviesIds.remove(movieId);
  }
}
