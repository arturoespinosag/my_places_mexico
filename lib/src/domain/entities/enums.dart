// ignore_for_file: prefer-match-file-name

enum PlaceKind {
  restaurant('restaurante', 'assets/icons/restaurant.png'),
  grocery('abarrotes', 'assets/icons/grocery.png'),
  school('escuela', 'assets/icons/school.png'),
  stationery('papeleria', 'assets/icons/stationery.png'),
  hotel('hotel', 'assets/icons/hotel.png'),
  gasStation('gasolineria', 'assets/icons/gas_station.png'),
  ;

  const PlaceKind(this.query, this.path);
  final String query;
  final String path;
}
