import 'package:flutter/material.dart';
import 'presentation/view/movie_list_view.dart';

import 'domain/entity/movie.dart';

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
      home: const Scaffold(
        backgroundColor: Colors.black12,
        body: MovieListView(),
      ),
    );
  }
}
