import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/util/constants/ui_constants.dart';
import '../../core/util/enums/endpoint.dart';
import '../../core/util/notifications/notification_service.dart';

import '../bloc/favorite_movies_ids.dart';
import '../bloc/movies_controller.dart';

class FavButton extends ConsumerStatefulWidget {
  const FavButton({
    super.key,
    required this.title,
    required this.id,
  });

  final String title;
  final int id;

  @override
  ConsumerState<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends ConsumerState<FavButton> {
  static const String removeActionText = 'Remove From Favorites';
  static const String addActionText = 'Add to Favorites';
  static const String notificationTitle = 'TheMovieDB';
  static const String removedNotificationBody = ' Removed from favorites';
  static const String addedNotificationBody = 'Added to favorites';

  bool isFavoriteMovie() {
    return ref
        .read(favoriteMoviesIdsProvider.notifier)
        .favoriteMoviesIds
        .contains(widget.id);
  }

  void showNotification({required String body}) {
    NotificationService().showNotification(
      title: notificationTitle,
      body: '${widget.title} $body',
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        ref.invalidate(moviesControllerProvider(Endpoint.favorites));
        isFavoriteMovie()
            ? setState(() {
                ref
                    .read(favoriteMoviesIdsProvider.notifier)
                    .removeFromFavorite(movieId: widget.id);
                showNotification(body: removedNotificationBody);
              })
            : setState(() {
                ref
                    .read(favoriteMoviesIdsProvider.notifier)
                    .addToFavorite(movieId: widget.id);
                showNotification(body: addedNotificationBody);
              });
      },
      icon: Icon(
        isFavoriteMovie() ? Icons.favorite : Icons.favorite_border_outlined,
        color: Colors.red,
        size: MovieDetailsUiConstants.iconSize,
      ),
      label: Text(
        isFavoriteMovie() ? removeActionText : addActionText,
      ),
    );
  }
}
