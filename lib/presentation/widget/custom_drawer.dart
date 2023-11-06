import 'package:flutter/material.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';
import '../../core/util/text_styles/custom_text_style.dart';
import '../bloc/movies_bloc.dart';
import '../view/movies_grid_view.dart';
import '../view/now_playing_movies_view.dart';
import '../view/upcoming_movies_view.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.bloc,
  });

  final MoviesBloc bloc;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black12,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              MovieDetailsUiConstants.moviesListTitle,
              style: CustomTextStyle.movieTitleTextStyleBoldWhite,
            ),
          ),
          DrawerTile(
            title: MovieDetailsUiConstants.popularMoviesLabel,
            view: MoviesGridView(
              bloc: bloc,
              endpoint: Endpoint.popular,
              title: MovieDetailsUiConstants.popularMoviesLabel,
            ),
          ),
          DrawerTile(
            title: MovieDetailsUiConstants.topRatedMoviesLabel,
            view: MoviesGridView(
              bloc: bloc,
              endpoint: Endpoint.topRated,
              title: MovieDetailsUiConstants.topRatedMoviesLabel,
            ),
          ),
          DrawerTile(
            title: MovieDetailsUiConstants.nowPlayingMoviesLabel,
            view: NowPlayingMoviesView(
              bloc: bloc,
            ),
          ),
          DrawerTile(
            title: MovieDetailsUiConstants.upcomingMoviesLabel,
            view: UpcomingMoviesView(
              bloc: bloc,
            ),
          ),
          DrawerTile(
            title: MovieDetailsUiConstants.favoriteMoviesLabel,
            view: MoviesGridView(
              bloc: bloc,
              title: MovieDetailsUiConstants.favoriteMoviesLabel,
              endpoint: Endpoint.favorites,
            ),
          )
        ],
      ),
    );
  }
}
