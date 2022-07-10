import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:appinio_code_challenge/data/mock_data/mock_forecast_data.dart';
import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:appinio_code_challenge/data/models/user_location.dart';
import 'package:appinio_code_challenge/data/service/location_service.dart';
import 'package:appinio_code_challenge/data/service/weather_service.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

final mockUserLoaction = UserLocation(
  city: 'Amberg',
  position: Position(
    longitude: 10,
    latitude: 10,
    timestamp: DateTime.now(),
    altitude: 1,
    speedAccuracy: 1,
    heading: 1,
    speed: 1,
    accuracy: 1,
  ),
);

class MockWeatherService extends Mock implements ChopperWeatherService {}

class MockLocationService extends Mock implements LocationService {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  group('WeatherCubit', () {
    late MockWeatherService weatherService;
    late WeatherCubit weatherCubit;
    late MockLocationService locationService;

    setUp(() async {
      weatherService = MockWeatherService();
      locationService = MockLocationService();
      weatherCubit = WeatherCubit(weatherService, locationService);
    });

    test('initial state is correct', () {
      expect(weatherCubit.state, const WeatherInitialState());
    });

    blocTest<WeatherCubit, WeatherState>(
      'emits [loading, loaded] when getWeather calls',
      build: () => weatherCubit,
      act: (cubit) => cubit.getWeatherData(),
      setUp: () {
        when(locationService.getCurrentLocation).thenAnswer(
          (_) => Future<UserLocation?>.value(
            mockUserLoaction,
          ),
        );
        when(
          () => weatherService.getWeather(10, 10),
        ).thenAnswer((_) async => ForecastData.fromJson(mockForecastData));
      },
      expect: () => <dynamic>[
        const WeatherLoadingState(),
        isA<WeatherLoadedState>(),
      ],
    );
    blocTest<WeatherCubit, WeatherState>(
      'invokes getWeather with correct location',
      build: () => weatherCubit,
      setUp: () {
        when(locationService.getCurrentLocation).thenAnswer(
          (_) => Future<UserLocation?>.value(mockUserLoaction),
        );
      },
      act: (cubit) => weatherCubit.getWeatherData(),
      verify: (_) {
        verify(() => weatherService.getWeather(
            mockUserLoaction.position.longitude,
            mockUserLoaction.position.latitude)).called(1);
      },
    );
  });
}
