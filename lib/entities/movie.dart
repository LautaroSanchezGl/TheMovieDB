class Movie {
  final String title;
  final String originalTitle;
  final List<String> genres;
  final String poster;
  final String backdrop;
  final String releaseDate;
  final String voteAverage;
  final String overview;

  const Movie(
    this.title,
    this.originalTitle,
    this.genres,
    this.poster,
    this.backdrop,
    this.releaseDate,
    this.voteAverage,
    this.overview,
  );

  factory Movie.mockMovie() {
    return const Movie(
      'The Super Mario Bros. Movie',
      'The Super Mario Bros. Movie',
      [
        'Animation',
        'Family',
        'Adventure',
        'Fantasy',
        'Comedy',
      ],
      'https://image.tmdb.org/t/p/w500/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg',
      'https://image.tmdb.org/t/p/w500/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
      '2023-04-05',
      '7,8',
      'While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi '
          'are transported down a mysterious pipe and wander into a magical new world. But when the '
          'brothers are separated, Mario embarks on an epic quest to find Luigi.',
    );
  }
}
