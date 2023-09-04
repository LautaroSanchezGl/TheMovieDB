import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/repository/movie_repository_interface.dart';

import '../../domain/entity/movie.dart';

class MovieRepositoryImp implements IMovieRepository {
  @override
  Future<List<Movie>> getMovies() async {
    final String response =
        await rootBundle.loadString('assets/mock_data/movies.json');
    List<dynamic> data = List.from(json.decode(response));
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }
}
