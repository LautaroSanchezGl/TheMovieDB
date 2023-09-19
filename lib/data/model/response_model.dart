import 'movie_model.dart';

class ResponseModel {
  int page;
  int totalResults;
  int totalPages;
  List<MovieModel> results;

  ResponseModel({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    List<MovieModel> movies = [];
    for (int i = 0; i < json['results'].length; i++) {
      MovieModel movie = MovieModel.fromJson(json['results'][i]);
      movies.add(movie);
    }
    return ResponseModel(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: movies,
    );
  }
}
