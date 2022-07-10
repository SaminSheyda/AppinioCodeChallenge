import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:appinio_code_challenge/data/models/user_location.dart';
import 'package:appinio_code_challenge/data/service/location_service.dart';
import 'package:appinio_code_challenge/data/service/weather_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


part 'weather_state.dart';

/// Account Recovery Cubit
class WeatherCubit extends Cubit<WeatherState> {
  /// Constructor
  WeatherCubit(this.weatherService,this.locationService) : super(const WeatherInitialState());

 final LocationService locationService;
final ChopperWeatherService weatherService;
  /// get weather data
  Future<void> getWeatherData() async {
    emit(const WeatherLoadingState());
    try {
    UserLocation? location =  await locationService.getCurrentLocation();

    if (location != null && location.city != null) {
      ForecastData response = await weatherService
          .getWeather(location.position.longitude, location.position.latitude);
      emit(WeatherLoadedState(cityName: location.city!, data: response));
    } else {
      emit(const WeatherErrorState(
          errorMessage: 'could not access to location'));
    }
    } catch (error) {
      emit(WeatherErrorState(errorMessage: error.toString()));
    }
  }
}
