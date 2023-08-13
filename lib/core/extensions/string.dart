extension StringX on String {
  String get capitalize {
    if (isEmpty) {
      return '';
    }
    if (length == 1) {
      return toUpperCase();
    }

    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get capitalizeWords =>
      isEmpty ? '' : split(' ').map((word) => word.capitalize).join(' ');
  String get fromSnakeCase => replaceAll('_', ' ');
  String get toSnakeCase => replaceAll(' ', '_');
  String take(int nbChars) => substring(0, nbChars.clamp(0, length));
}

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
