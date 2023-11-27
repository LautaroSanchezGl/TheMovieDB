import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/model/data_state.dart';

import '../../../data/repository/movie_repository.dart';
import '../../entity/movie.dart';

import '../../repository/movie_repository_interface.dart';
import '../usecase_interface.dart';

part'get_movies_usecase.g.dart';

class GetMoviesUseCase implements UseCase<DataState> {
  final IMovieRepository movieRepository;
  static const String errorDataBase = 'data base failed';

  GetMoviesUseCase({
    required this.movieRepository,
  });

  @override
  Future<DataState<List<Movie>>> call({params}) async {
    DataState<List<Movie>> movies =
        await movieRepository.getMovies(params: params);

    return movies;
  }
}

@riverpod
GetMoviesUseCase getMoviesUseCase(GetMoviesUseCaseRef ref){
  var movieRepository = ref.watch(movieRepositoryImpProvider);
  return GetMoviesUseCase(movieRepository: movieRepository);
}
