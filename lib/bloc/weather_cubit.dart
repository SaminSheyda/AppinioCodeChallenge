import 'dart:developer' as logger;
import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:appinio_code_challenge/data/models/user_location.dart';
import 'package:appinio_code_challenge/data/service/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'weather_state.dart';

/// Account Recovery Cubit
class WeatherCubit extends Cubit<WeatherState> {
  /// Constructor
  WeatherCubit() : super(const WeatherInitialState()) {
    getWeatherData();
  }

  /// get weather data
  Future<void> getWeatherData() async {
    emit(const WeatherLoadingState());
    // try {
    UserLocation? location = await getCurrentLocation();
    if (location != null && location.city != null) {
      var response = await ChopperWeatherService()
          .getWeather(location.position.longitude, location.position.latitude);
      print("aaaaaaaaaaaaaaaaaaaa");
      print(response);

      emit(WeatherLoadedState(cityName: location.city!));
    } else {
      emit(const WeatherErrorState(
          errorMessage: 'could not access to location'));
    }
    // } catch (error) {
    //   emit(WeatherErrorState(errorMessage: error.toString()));
    // }
  }

  /// get current location of the device
  Future<UserLocation?> getCurrentLocation() async {
    final Position position = await _determinePosition();
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    logger.log('location data is ${placemarks[0]}');
    return UserLocation(city: placemarks[0].locality, position: position);
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
