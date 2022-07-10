part of 'weather_cubit.dart';

/// Weather feature states
abstract class WeatherState extends Equatable {
  /// Initializes states.
  const WeatherState();
}

/// Initial state.
class WeatherInitialState extends WeatherState {
  /// Initializes initial state.
  const WeatherInitialState();

  @override
  List<Object?> get props => [];
}

/// User have Account.
class WeatherLoadingState extends WeatherState {
  /// loading state.
  const WeatherLoadingState();

  @override
  String toString() => 'WeatherLoadingState';

  @override
  List<Object?> get props => [];
}

/// User do not have Account.
class WeatherErrorState extends WeatherState {
  /// Initializes weather loading error State
  const WeatherErrorState({
    required this.errorMessage,
  });

  /// The message of the SignUp error.
  final String errorMessage;

  @override
  String toString() => 'WeatherErrorState';

  @override
  List<Object?> get props => [errorMessage];
}

/// User do not have Account.
class WeatherLoadedState extends WeatherState {
  /// Initializes loaded State
  const WeatherLoadedState({required this.cityName,required this.data});

  @override
  String toString() => 'WeatherLoadedState';

  final String cityName;
  final ForecastData data;

  @override
  List<Object?> get props => [cityName,data];
}
