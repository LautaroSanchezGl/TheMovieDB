import '../../domain/entity/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required bool adult,
    required String backdropPath,
    required List<int> genreIds,
    required int id,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genres: genreIds,
          id: id,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: List<int>.from(json['genre_ids']),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
    );
  }
}
