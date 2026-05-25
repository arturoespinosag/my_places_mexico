import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/features/features.dart';

void main() {
  group('SearchBarWidget', () {
    testWidgets('renders search icon and hint text', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SearchBarWidget(),
          ),
        ),
      );

      expect(find.byIcon(Icons.search), findsOneWidget);
      expect(find.text('Buscar'), findsOneWidget);
    });

    testWidgets('calls onChanged when text is entered', (tester) async {
      String? changedValue;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SearchBarWidget(
              onChanged: (value) => changedValue = value,
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), 'restaurante');
      expect(changedValue, 'restaurante');
    });
  });
}
