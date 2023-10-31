enum Endpoint {
  popular(category: 'popular'),
  nowPlaying(category: 'nowPlaying'),
  upcoming(category: 'upcoming'),
  topRated(category: 'topRated');

  const Endpoint({required this.category});

  final String category;
}
