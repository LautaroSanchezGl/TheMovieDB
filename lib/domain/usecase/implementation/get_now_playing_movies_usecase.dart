import '../../../core/util/enums/endpoint.dart';
import '../../../data/model/data_state.dart';

import '../../../data/repository/movie_repository.dart';
import '../../entity/movie.dart';
import '../../repository/movie_repository_interface.dart';
import '../usecase_interface.dart';

class GetNowPlayingMoviesUseCase implements UseCase<DataState> {
  IMovieRepository movieRepository = MovieRepositoryImp();
  @override
  Future<DataState<List<Movie>>> call({params}) {
    return movieRepository.getMovies(endpoint: Endpoint.nowPlaying);
  }
}
