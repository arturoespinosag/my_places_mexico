import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/features/features.dart';

void main() {
  group('ListIconWidget', () {
    testWidgets('renders the given icon', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListIconWidget(
              icon: Icons.list,
              isSelected: false,
              onTap: () {},
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.list), findsOneWidget);
    });

    testWidgets('calls onTap when tapped', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ListIconWidget(
              icon: Icons.list,
              isSelected: false,
              onTap: () => tapped = true,
            ),
          ),
        ),
      );

      await tester.tap(find.byType(GestureDetector));
      expect(tapped, true);
    });
  });
}
