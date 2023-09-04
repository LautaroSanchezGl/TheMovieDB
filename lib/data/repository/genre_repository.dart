import 'dart:convert';

import 'package:flutter/services.dart';
import '../../domain/repository/genre_repository_interface.dart';
import '../../domain/entity/genre.dart';

class GenreRepositoryImp implements IGenreRepository {
  @override
  Future<List<Genre>> getGenreNamesById(List<num> ids) async {
    final String response =
        await rootBundle.loadString('assets/mock_data/genres.json');
    List<dynamic> genres = json.decode(response)['genres'];
    return genres
        .where((genre) => ids.contains(genre['id']))
        .map((gen) => Genre.fromJson(gen))
        .toList();
  }
}
