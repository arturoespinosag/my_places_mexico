import 'package:flutter_test/flutter_test.dart';
import 'package:myplaces_mexico/core/core.dart';

void main() {
  group('StringX', () {
    group('capitalize', () {
      test('capitalizes first letter of a string', () {
        expect('hello'.capitalize, 'Hello');
      });

      test('returns empty string for empty input', () {
        expect(''.capitalize, '');
      });

      test('returns uppercase for single character', () {
        expect('a'.capitalize, 'A');
      });

      test('does not change already capitalized string', () {
        expect('Hello'.capitalize, 'Hello');
      });

      test('lowercases subsequent letters', () {
        expect('hELLO'.capitalize, 'HELLO');
      });
    });

    group('capitalizeWords', () {
      test('capitalizes each word', () {
        expect('hello world'.capitalizeWords, 'Hello World');
      });

      test('returns empty string for empty input', () {
        expect(''.capitalizeWords, '');
      });

      test('handles single word', () {
        expect('hello'.capitalizeWords, 'Hello');
      });
    });

    group('fromSnakeCase', () {
      test('replaces underscores with spaces', () {
        expect('hello_world'.fromSnakeCase, 'hello world');
      });

      test('handles string without underscores', () {
        expect('hello'.fromSnakeCase, 'hello');
      });
    });

    group('toSnakeCase', () {
      test('replaces spaces with underscores', () {
        expect('hello world'.toSnakeCase, 'hello_world');
      });

      test('handles string without spaces', () {
        expect('hello'.toSnakeCase, 'hello');
      });
    });

    group('take', () {
      test('returns first n characters', () {
        expect('hello'.take(3), 'hel');
      });

      test('returns whole string if n exceeds length', () {
        expect('hello'.take(10), 'hello');
      });

      test('returns empty string for n <= 0', () {
        expect('hello'.take(0), '');
        expect('hello'.take(-1), '');
      });
    });
  });

  group('StringCasingExtension', () {
    group('toCapitalized', () {
      test('capitalizes first letter and lowercases rest', () {
        expect('hello'.toCapitalized(), 'Hello');
        expect('HELLO'.toCapitalized(), 'Hello');
      });

      test('returns empty string for empty input', () {
        expect(''.toCapitalized(), '');
      });
    });

    group('toTitleCase', () {
      test('title cases a multi-word string', () {
        expect('hello world'.toTitleCase(), 'Hello World');
      });

      test('handles extra spaces', () {
        expect('hello   world'.toTitleCase(), 'Hello World');
      });

      test('returns empty string for empty input', () {
        expect(''.toTitleCase(), '');
      });
    });
  });
}
