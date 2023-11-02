import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/notifications/notification_service.dart';
import '../bloc/movies_bloc.dart';

class FavButton extends StatefulWidget {
  const FavButton({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final int id;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  static const String removeActionText = 'Remove From Favorites';
  static const String addActionText = 'Add to Favorites';
  static const String notificationTitle = 'TheMovieDB';
  static const String removedNotificationBody = ' Removed from favorites';
  static const String addedNotificationBody = 'Added to favorites';

  bool isFav() =>
      Provider.of<MoviesBloc>(context).favMovies.contains(widget.id);

  void showNotification({required String body}) {
    NotificationService().showNotification(
      title: notificationTitle,
      body: '${widget.title} $body',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: isFav()
          ? () => setState(() {
                Provider.of<MoviesBloc>(context, listen: false)
                    .removeFavMovie(movieId: widget.id);
                showNotification(body: removedNotificationBody);
              })
          : () => setState(() {
                Provider.of<MoviesBloc>(context, listen: false)
                    .addFavMovie(movieId: widget.id);
                showNotification(body: addedNotificationBody);
              }),
      icon: Icon(
        isFav() ? Icons.favorite : Icons.favorite_border_outlined,
        color: Colors.red,
        size: MovieDetailsUiConstants.iconSize,
      ),
      label: Text(
        isFav() ? removeActionText : addActionText,
      ),
    );
  }
}
