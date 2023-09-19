class Movie {
  final int voteCount;
  final bool video;
  final double popularity;
  final String originalLanguage;
  final int id;
  final bool adult;
  final String title;
  final String originalTitle;
  final List<int> genres;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final String overview;

  const Movie({
    required this.voteCount,
    required this.video,
    required this.popularity,
    required this.originalLanguage,
    required this.id,
    required this.adult,
    required this.title,
    required this.originalTitle,
    required this.genres,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
  });

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
      voteCount: 1,
      video: false,
      popularity: 23,
      originalLanguage: 'en',
      id: 1234,
      adult: false,
      title: 'The Super Mario Bros. Movie',
      originalTitle: 'The Super Mario Bros. Movie',
      genres: [
        18,
        24,
        16,
      ],
      posterPath:
          'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
      backdropPath:
          'https://image.tmdb.org/t/p/w500/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
      releaseDate: '2023-04-05',
      voteAverage: 7.8,
      overview:
          'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi '
          'are transported down a mysterious pipe and wander into a magical new world. But when the '
          'brothers are separated, Mario embarks on an epic quest to find Luigi.',
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          voteCount == other.voteCount &&
          id == other.id &&
          voteAverage == other.voteAverage;

  @override
  int get hashCode => voteCount.hashCode ^ id.hashCode ^ voteAverage.hashCode;
}
