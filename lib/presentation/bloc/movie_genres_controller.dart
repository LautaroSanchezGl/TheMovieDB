import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/model/data_state.dart';
import '../../domain/entity/genre.dart';
import '../../domain/usecase/implementation/get_movie_genres_usecase.dart';
part 'movie_genres_controller.g.dart';

@riverpod
class MovieGenresController extends _$MovieGenresController {
  @override
  FutureOr<List<Genre>> build(List<int> ids) {
    return getMovieGenres(ids);
  }

  Future<List<Genre>> getMovieGenres(List<int> ids) async {
    final useCase = ref.read(getMovieGenresUseCaseProvider);

    DataState<List<Genre>> data = await useCase.call(params: ids);
    return data.data!;
  }
}
