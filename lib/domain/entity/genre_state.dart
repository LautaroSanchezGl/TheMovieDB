import '../../core/util/enums/status.dart';
import 'genre.dart';

class GenreState {
  final Status status;
  final List<Genre>? genres;
  final String? errorMsg;

  GenreState({
    required this.status,
    this.genres,
    this.errorMsg,
  });
}
