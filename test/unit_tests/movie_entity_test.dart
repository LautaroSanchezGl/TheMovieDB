import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:movie_db/domain/entity/movie.dart';

@GenerateMocks([
  Movie,
])
void main() {
  test("should return identical object from correct mapping", () {
    Movie expectedMovie = const Movie(
      voteCount: 1,
      video: false,
      popularity: 1,
      originalLanguage: 'originalLanguage',
      id: 1,
      adult: true,
      title: 'title',
      originalTitle: 'originalTitle',
      genres: [],
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      releaseDate: 'releaseDate',
      voteAverage: 1,
      overview: 'overview',
    );
    Map<String, dynamic> json = {
      'vote_count': 1,
      'video': false,
      'popularity': 1.0,
      'original_language': 'originalLanguage',
      'id': 1,
      'adult': true,
      'title': 'title',
      'original_title': 'originalTitle',
      'poster_path': 'posterPath',
      'genre_ids': [],
      'backdrop_path': 'backdropPath',
      'release_date': 'releaseDate',
      'vote_average': 1.0,
      'overview': 'overview',
    };

    expect(Movie.fromJson(json), expectedMovie);
  });

  test("should return not identical object from incorrect mapping", () {
    Movie compareMovie = const Movie(
      voteCount: 2,
      video: false,
      popularity: 1,
      originalLanguage: 'originalLanguage',
      id: 1,
      adult: true,
      title: 'title',
      originalTitle: 'originalTitle',
      genres: [],
      posterPath: 'posterPath',
      backdropPath: 'backdropPath',
      releaseDate: 'releaseDate',
      voteAverage: 1,
      overview: 'overview',
    );
    Map<String, dynamic> json = {
      'vote_count': 1,
      'video': false,
      'popularity': 1.0,
      'original_language': 'originalLanguage',
      'id': 1,
      'adult': true,
      'title': 'title',
      'original_title': 'originalTitle',
      'poster_path': 'posterPath',
      'genre_ids': [],
      'backdrop_path': 'backdropPath',
      'release_date': 'releaseDate',
      'vote_average': 1.0,
      'overview': 'overview',
    };

    expect(Movie.fromJson(json) == compareMovie, isFalse);
  });
}
