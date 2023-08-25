import 'dart:convert';

import 'package:flutter/services.dart';
import '../entities/genre.dart';

class GenreRepository {
  Future<List<Genre>> getGenreNamesById(List<num> ids) async {
    final String response =
        await rootBundle.loadString('assets/mock_data/genres.json');
    List<dynamic> genres = json.decode(response)['genres'];
    return genres
        .where((genre) => ids.contains(genre['id']))
        .toList()
        .map((gen) => Genre.fromJson(gen))
        .toList();
  }
}
