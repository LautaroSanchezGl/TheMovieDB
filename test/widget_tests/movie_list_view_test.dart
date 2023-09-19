import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_db/core/util/enums/endpoint.dart';
import 'package:movie_db/core/util/enums/status.dart';
import 'package:movie_db/data/model/data_state.dart';
import 'package:movie_db/domain/entity/movie.dart';
import 'package:movie_db/domain/entity/movie_state.dart';
import 'package:movie_db/presentation/bloc/movies_bloc.dart';
import 'package:movie_db/presentation/view/movie_list_view.dart';
import 'package:movie_db/presentation/widget/movie_info.dart';
import 'package:network_image_mock/network_image_mock.dart';

import 'movie_list_view_test.mocks.dart';

@GenerateMocks([
  MoviesBloc,
])
void main() {
  late MockMoviesBloc mockMoviesBloc;
  late StreamController<MovieState> mockController;
  late List<Movie> movies;

  setUp(() {
    mockMoviesBloc = MockMoviesBloc();
    mockController = StreamController<MovieState>();
    movies = [
      Movie.mockMovie(),
      Movie.mockMovie(),
      Movie.mockMovie(),
      Movie.mockMovie()
    ];
    mockController.add(
      MovieState(
        status: Status.success,
        movies: movies,
      ),
    );
    when(mockMoviesBloc.movies)
        .thenAnswer((realInvocation) => mockController.stream);
    when(mockMoviesBloc.getMovies(Endpoint.nowPlaying)).thenReturn(());
    when(mockMoviesBloc.initialData)
        .thenReturn(MovieState(status: Status.loading));
  });

  Widget _buildWidget() {
    return MaterialApp(
      home: Scaffold(
          body: MovieListView(
        bloc: mockMoviesBloc,
      )),
    );
  }

  testWidgets('should find  MovieInfo widgets ', (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(_buildWidget());
      await tester.pump(const Duration(milliseconds: 50));
      //
    });

    expect(find.byType(MovieInfo), findsWidgets);
  });

  testWidgets('should find last MovieInfo widget based on key after scroll',
      (WidgetTester tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(_buildWidget());
      await tester.pump(const Duration(milliseconds: 50));
      await tester.scrollUntilVisible(
          find.byKey(Key('movie${movies.length - 1}')), 100);

      //
    });

    expect(find.byKey(Key('movie${movies.length - 1}')), findsOneWidget);
  });
}
