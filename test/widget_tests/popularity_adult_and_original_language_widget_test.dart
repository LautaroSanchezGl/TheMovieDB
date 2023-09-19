// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_db/presentation/widget/middle_text.dart';

import 'package:movie_db/presentation/widget/popularity_adult_and_original_language.dart';

void main() {

  Widget _buildWidget( ){
    return const MaterialApp(
      home: Scaffold(
        body: PopularityAdultAndLanguage(popularityValue: 1, adult: false, originalLanguage: 'en'),
      ),
    );
  }
  testWidgets('should find 3 Texts with corresponding arguments', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( _buildWidget());


    expect(find.text('Language: EN'), findsOneWidget);
    expect(find.text('Popularity: 1'), findsOneWidget);
    expect(find.text('Adult: false'), findsOneWidget);

  });

  testWidgets('should find 3 Middle type Widgets', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( _buildWidget());


    expect(find.byType(Middle),findsNWidgets(3));

  });
}
