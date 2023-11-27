import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/util/constants/ui_constants.dart';
import 'core/util/enums/endpoint.dart';
import 'core/util/notifications/notification_service.dart';

import 'presentation/view/movies_grid_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotifications();
  const databaseName = 'movie_database_v3';
  //final db = await $FloorMovieDatabase.databaseBuilder(databaseName).build();
  //final genreDatabaseRepositoryImp = GenreDatabaseRepositoryImp(db);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

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
        body: MoviesGridView(
          endpoint: Endpoint.popular,
          title: MovieDetailsUiConstants.popularMoviesLabel,
        ),
      ),
    );
  }
}
