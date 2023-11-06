enum Endpoint {
  popular(category: 'popular'),
  nowPlaying(category: 'nowPlaying'),
  upcoming(category: 'upcoming'),
  topRated(category: 'topRated'),
  favorites(category: 'favorite');

  const Endpoint({required this.category});

  final String category;
}
