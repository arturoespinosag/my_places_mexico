// ignore_for_file: prefer-match-file-name

enum PlaceKind {
  restaurant('restaurante'),
  grocery('abarrotes'),
  school('escuela'),
  stationery('papeleria'),
  hotel('hotel'),
  gasStation('gasolineria');

  const PlaceKind(this.query);
  final String query;
}
