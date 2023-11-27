import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../core/util/enums/endpoint.dart';
import '../../data/model/data_state.dart';
import '../../domain/entity/movie.dart';
import '../../domain/usecase/implementation/get_movies_usecase.dart';
import 'favorite_movies_ids.dart';
part 'movies_controller.g.dart';

@riverpod
class MoviesController extends _$MoviesController {
  @override
  FutureOr<List<Movie>> build(Endpoint endpoint) {
    return getMovies(endpoint!);
  }

  Future<List<Movie>> getMovies(Endpoint endpoint) async {
    final moviesUsecase = ref.read(getMoviesUseCaseProvider);
    final ids = ref.read(favoriteMoviesIdsProvider.notifier).favoriteMoviesIds;
    final params = <String, dynamic>{};
    params.addAll({'endpoint': endpoint});

    if (endpoint == Endpoint.favorites) {
      params.addAll({'movieIds': ids});
    }
    DataState<List<Movie>> data = await moviesUsecase.call(params: params);
    return data.data!;
  }
}
