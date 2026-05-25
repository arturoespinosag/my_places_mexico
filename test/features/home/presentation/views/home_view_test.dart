import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:myplaces_mexico/features/features.dart';

class MockHomeBloc extends Mock implements HomeBloc {}

void main() {
  late MockHomeBloc mockHomeBloc;

  setUp(() {
    mockHomeBloc = MockHomeBloc();
    when(() => mockHomeBloc.state).thenReturn(const HomeState());
    when(() => mockHomeBloc.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockHomeBloc.isClosed).thenReturn(false);
    when(() => mockHomeBloc.searchController).thenReturn(
      TextEditingController(),
    );
  });

  group('HomeView', () {
    testWidgets('renders bottom navigation with 4 destinations', (
      tester,
    ) async {
      await tester.pumpWidget(
        BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: const MaterialApp(
            home: HomeView(
              navigationViews: [
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Map'), findsOneWidget);
      expect(find.text('Favorites'), findsOneWidget);
      expect(find.text('Profile'), findsOneWidget);
    });

    testWidgets('does not show AppBar when selectedIndex is not 0', (
      tester,
    ) async {
      when(() => mockHomeBloc.state).thenReturn(
        const HomeState(selectedIndex: 1),
      );
      await tester.pumpWidget(
        BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: const MaterialApp(
            home: HomeView(
              navigationViews: [
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
              ],
            ),
          ),
        ),
      );

      expect(find.text('My Places'), findsNothing);
    });

    testWidgets('shows AppBar when selectedIndex is 0', (
      tester,
    ) async {
      await tester.pumpWidget(
        BlocProvider<HomeBloc>.value(
          value: mockHomeBloc,
          child: const MaterialApp(
            home: HomeView(
              navigationViews: [
                SizedBox(),
                SizedBox(),
                SizedBox(),
                SizedBox(),
              ],
            ),
          ),
        ),
      );

      expect(find.text('My Places'), findsOneWidget);
    });
  });
}
