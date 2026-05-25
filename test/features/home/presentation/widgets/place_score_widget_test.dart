import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/features/features.dart';

void main() {
  group('PlaceScoreWidget', () {
    testWidgets('renders 5 star outlines', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlaceScoreWidget(),
          ),
        ),
      );

      expect(find.byIcon(Icons.star_border_outlined), findsNWidgets(5));
    });
  });
}
