import 'dart:convert';
import 'package:flutter/services.dart';

import '../entities/movie.dart';

class MovieRepository {
  Future<List<Movie>> getMovies() async {
    final String response =
        await rootBundle.loadString('assets/mock_data/movies.json');
    List<dynamic> data = List.from(json.decode(response));
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }
}
