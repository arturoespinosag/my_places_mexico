import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:myplaces_mexico/core/core.dart';
import 'package:myplaces_mexico/features/features.dart';
import 'package:myplaces_mexico/src/src.dart';

class AppRouter {
  const AppRouter._();
  static GoRouter router = GoRouter(routes: [
    GoRoute(
      path: Routes.homePage,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.placeDetailsPage,
      builder: (context, state) {
        final place = state.extra as PlaceWithDistance?;
        return PlaceDetailsPage(
          place: place,
        );
      },
    )
  ]);
}

extension SafeNavigation on BuildContext {
  void safePop([Object? arguments]) {
    if (canPop()) pop(arguments);
  }
}
