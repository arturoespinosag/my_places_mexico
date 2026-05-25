import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/src/domain/domain.dart';

void main() {
  group('Category', () {
    test('creates a Category with given iconPath and label', () {
      final category = Category(
        iconPath: 'assets/pages/home_page/restaurant.svg',
        label: 'Restaurante',
      );
      expect(category.iconPath, 'assets/pages/home_page/restaurant.svg');
      expect(category.label, 'Restaurante');
    });
  });
}
