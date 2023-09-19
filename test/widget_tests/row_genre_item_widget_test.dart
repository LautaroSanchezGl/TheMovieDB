import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movie_db/presentation/widget/row_genre_item.dart';

void main() {
  Widget _buildWidget() {
    return const MaterialApp(
      home: Scaffold(
        body: RowGenreItem(
          genre: 'mockText',
        ),
      ),
    );
  }

  testWidgets(
      'should find 1 Text widget with correct genre passed as parameter ',
      (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(_buildWidget());

    expect(find.text('mockText'), findsOneWidget);
  });
}
