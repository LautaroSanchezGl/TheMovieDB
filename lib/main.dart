import 'package:flutter/material.dart';

import 'core/util/constants/ui_constants.dart';
import 'core/util/enums/endpoint.dart';
import 'data/datasource/local/movie_database.dart';
import 'data/datasource/remote/api_service.dart';
import 'data/repository/genre_database_repository_imp.dart';
import 'data/repository/movie_database_repository_imp.dart';
import 'data/repository/movie_repository.dart';
import 'domain/repository/movie_database_repository_interface.dart';
import 'domain/repository/movie_repository_interface.dart';
import 'domain/usecase/implementation/get_movie_genres_usecase.dart';
import 'domain/usecase/implementation/get_movies_usecase.dart';

import 'presentation/bloc/movie_genres_bloc.dart';
import 'presentation/bloc/movies_bloc.dart';
import 'presentation/view/movies_grid_view.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const databaseName = 'movie_database_v3';
  final db = await $FloorMovieDatabase.databaseBuilder(databaseName).build();
  final apiService = ApiService();
  final genreDatabaseRepositoryImp = GenreDatabaseRepositoryImp(db);

  runApp(Provider(
    create: (_) => MovieGenresBloc(
      useCase: GetMovieGenresUseCase(
          genreDatabaseRepository: genreDatabaseRepositoryImp),
    ),
    child: MyApp(
      movieRepository: MovieRepositoryImp(apiService: apiService),
      movieDatabaseRepository: MovieDatabaseRepositoryImp(db),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.movieRepository,
    required this.movieDatabaseRepository,
  });

  final IMovieRepository movieRepository;
  final IMovieDatabaseRepository movieDatabaseRepository;

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
            moviesUsecase: GetMoviesUseCase(
              movieRepository: movieRepository,
              movieDataBaseRepository: movieDatabaseRepository,
            ),
          ),
          endpoint: Endpoint.popular,
          title: MovieDetailsUiConstants.popularMoviesLabel,
        ),
      ),
    );
  }
}
