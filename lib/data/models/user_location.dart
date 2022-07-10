import 'package:geolocator/geolocator.dart';

/// user's location data class
class UserLocation {
  /// constructor
  UserLocation({required this.city, required this.position});

  /// nae of the city
  String? city;

  /// geo location data
  Position position;
}
