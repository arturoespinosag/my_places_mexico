import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/features/home/presentation/views/places_view.dart';
import 'package:rive/rive.dart';

void main() {
  setUpAll(() async {
    await RiveNative.init();
  });

  testWidgets('renders RiveSearchLoader', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: RiveSearchLoader())),
    );

    expect(find.byType(RiveSearchLoader), findsOneWidget);
    // Pump frames to load asset and advance animation
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.byType(RiveArtboardWidget), findsOneWidget);
  });

  testWidgets('renders RiveLocationLoader', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: RiveLocationLoader())),
    );

    expect(find.byType(RiveLocationLoader), findsOneWidget);
    // Pump frames to load asset and advance animation
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.byType(RiveArtboardWidget), findsOneWidget);
  });
}
