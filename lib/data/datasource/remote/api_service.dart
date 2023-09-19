import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../model/data_state.dart';
import '../../model/genre_model.dart';

import '../../model/movie_model.dart';
import '../../model/response_model.dart';

class ApiService {
  static const String authToken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTY1ZjQ0YjIzYWQ0MDU0NmRhODlhNjgxZDA3NGUzMSIsInN1YiI6IjY0ZmIyOTcxYWY1OGNiMGE2MmU4M2NlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.laM3iXSCw-7DQbeVAx6nimMtHj3RfTq-XtmSiQoMcPI';
  static const String genresUrl =
      'https://api.themoviedb.org/3/genre/movie/list';
  static const String errorMsg = 'error while fetching genres';

  Future<DataState<List<GenreModel>>> getGenreNamesById(List<num> ids) async {
    try {
      final response = await http.get(
        Uri.parse(
          genresUrl,
        ),
        headers: {
          HttpHeaders.authorizationHeader: authToken,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        List<dynamic> genres = json.decode(response.body)['genres'];
        return DataSuccess(
          genres
              .where((genre) => ids.contains(genre['id']))
              .map(
                (gen) => GenreModel.fromJson(gen),
              )
              .toList(),
        );
      } else {
        return const DataFailed(errorMsg);
      }
    } on Error {
      return const DataFailed(errorMsg);
    }
  }

  Future<DataState<List<MovieModel>>> getMovies(String url) async {
    try {
      final response = await http.get(
        Uri.parse(
          url,
        ),
        headers: {
          HttpHeaders.authorizationHeader: authToken,
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        dynamic data = jsonDecode(response.body);
        return DataSuccess(
          ResponseModel.fromJson(data).results,
        );
      } else {
        return const DataFailed(errorMsg);
      }
    } on Error {
      return const DataFailed(errorMsg);
    }
  }
}
