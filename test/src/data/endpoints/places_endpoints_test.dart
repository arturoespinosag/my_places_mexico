import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/src/src.dart';

void main() {
  group('PlacesEndpoint', () {
    test('search builds correct URL path', () {
      final path = PlacesEndpoint.search(
        'restaurante',
        '19.4326,-99.1332',
        '500',
      );
      expect(
        path,
        'Buscar/restaurante/19.4326,-99.1332/500/dd7b6015-41f2-40e3-b97f-aa2b332edd16',
      );
    });

    test('individual builds correct URL path', () {
      final path = PlacesEndpoint.individual('12345');
      expect(
        path,
        'Ficha/12345/dd7b6015-41f2-40e3-b97f-aa2b332edd16',
      );
    });
  });
}
