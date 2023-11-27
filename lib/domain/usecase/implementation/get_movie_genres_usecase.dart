import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/data_state.dart';

import '../../../data/repository/genre_repository.dart';
import '../../entity/genre.dart';

import '../../repository/genre_repository_interface.dart';
import '../usecase_interface.dart';
part 'get_movie_genres_usecase.g.dart';

class GetMovieGenresUseCase implements UseCase<DataState> {
  final IGenreRepository genreRepository;

  GetMovieGenresUseCase({
    required this.genreRepository,
  });

  @override
  Future<DataState<List<Genre>>> call({params}) async {
    DataState<List<Genre>> genres =
        await genreRepository.getMovieGenres(params);
    return genres;
  }
}

@riverpod
GetMovieGenresUseCase getMovieGenresUseCase(GetMovieGenresUseCaseRef ref) {
  return GetMovieGenresUseCase(
      genreRepository: ref.watch(genreRepositoryImpProvider));
}
