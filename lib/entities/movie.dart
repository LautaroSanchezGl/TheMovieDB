class Movie {
  final num voteCount;
  final bool video;
  final num popularity;
  final String originalLanguage;
  final num id;
  final bool adult;
  final String title;
  final String originalTitle;
  final List<num> genres;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final num voteAverage;
  final String overview;

  const Movie(
    this.voteCount,
    this.video,
    this.popularity,
    this.originalLanguage,
    this.id,
    this.adult,
    this.title,
    this.originalTitle,
    this.genres,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    this.voteAverage,
    this.overview,
  );

  Movie.fromJson(Map<String, dynamic> json)
      : voteCount = json['vote_count'],
        video = json['video'],
        popularity = json['popularity'],
        originalLanguage = json['original_language'],
        id = json['id'],
        adult = json['adult'],
        title = json['title'],
        originalTitle = json['original_title'],
        posterPath = json['poster_path'],
        genres = [...json['genre_ids']],
        backdropPath = json['backdrop_path'],
        releaseDate = json['release_date'],
        voteAverage = json['vote_average'],
        overview = json['overview'];

  factory Movie.mockMovie() {
    return const Movie(
      1,
      false,
      23,
      'en',
      1234,
      false,
      'The Super Mario Bros. Movie',
      'The Super Mario Bros. Movie',
      [
        18,
        24,
        16,
      ],
      'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
      'https://image.tmdb.org/t/p/w500/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
      '2023-04-05',
      7.8,
      'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi '
          'are transported down a mysterious pipe and wander into a magical new world. But when the '
          'brothers are separated, Mario embarks on an epic quest to find Luigi.',
    );
  }
}
