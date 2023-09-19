import '../../core/util/enums/status.dart';
import 'movie.dart';

class MovieState {
  final Status status;
  final List<Movie>? movies;
  final String? errorMsg;

  MovieState({
    required this.status,
    this.movies,
    this.errorMsg,
  });
}
