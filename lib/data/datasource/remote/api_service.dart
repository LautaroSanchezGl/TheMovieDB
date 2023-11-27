import 'dart:convert';
import 'dart:io';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;

import '../../../core/util/constants/ui_constants.dart';
import '../../model/data_state.dart';
import '../../model/genre_model.dart';

import '../../model/movie_model.dart';
import '../../model/response_model.dart';

part 'api_service.g.dart';

class ApiService {
  static const String authToken =
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5YTY1ZjQ0YjIzYWQ0MDU0NmRhODlhNjgxZDA3NGUzMSIsInN1YiI6IjY0ZmIyOTcxYWY1OGNiMGE2MmU4M2NlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.laM3iXSCw-7DQbeVAx6nimMtHj3RfTq-XtmSiQoMcPI';
  static const String genresUrl =
      'https://api.themoviedb.org/3/genre/movie/list';
  static const String errorMsg = 'error while fetching genres';
  static const String favoriteMoviesErrorMsg =
      'error while fetching favorite movies';

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

  Future<List<GenreModel>> getAllGenres() async {
    try {
      final response = await http.get(
        Uri.parse(
          genresUrl,
        ),
        headers: {
          HttpHeaders.authorizationHeader: authToken,
        },
      );
      List<dynamic> genres = json.decode(response.body)['genres'];
      return genres
          .map(
            (genre) => GenreModel.fromJson(genre),
          )
          .toList();
    } on Exception catch (e) {
      rethrow;
    }
  }

  Future<DataState<List<MovieModel>>> getMoviesByIds(
      List<int> movieIds) async {
    List<MovieModel> favoriteMovies = [];
    try {
      for (final id in movieIds) {
        final response = await http.get(
          Uri.parse(
            '${MovieDetailsUiConstants.baseUrl}/$id',
          ),
          headers: {
            HttpHeaders.authorizationHeader: authToken,
          },
        );
        if (response.statusCode == HttpStatus.ok) {
          favoriteMovies.add(
            MovieModel.favoriteMovieFromJson(
              json.decode(
                response.body,
              ),
            ),
          );
        } else {
          return const DataFailed(
            favoriteMoviesErrorMsg,
          );
        }
      }
      return DataSuccess(
        favoriteMovies,
      );
    } on Exception catch (e) {
      return DataFailed(e.toString());
    }
  }
}

@riverpod
ApiService apiService(ApiServiceRef ref){
  return ApiService();
}

