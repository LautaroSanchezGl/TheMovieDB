import 'package:flutter/material.dart';

import 'core/util/constants/ui_constants.dart';
import 'core/util/enums/endpoint.dart';
import 'domain/entity/movie.dart';
import 'domain/usecase/implementation/get_now_playing_movies_usecase.dart';
import 'domain/usecase/implementation/get_popular_movies_usecase.dart';
import 'domain/usecase/implementation/get_top_rated_movies_usecase.dart';
import 'domain/usecase/implementation/get_upcoming_movies_usecase.dart';
import 'presentation/bloc/movies_bloc.dart';
import 'presentation/view/movies_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Movie movie = Movie.mockMovie();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.black12,
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.black12,
        body: MoviesGridView(
          bloc: MoviesBloc(
            popularUsecase: GetPopularMoviesUseCase(),
            nowPlayingUsecase: GetNowPlayingMoviesUseCase(),
            topRatedUsecase: GetTopRatedMoviesUseCase(),
            upcomingUsecase: GetUpcomingMoviesUseCase(),
          ),
          endpoint: Endpoint.popular,
          title: MovieDetailsUiConstants.popularMoviesLabel,
        ),
      ),
    );
  }
}
