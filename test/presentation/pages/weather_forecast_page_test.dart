import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:appinio_code_challenge/data/service/location_service.dart';
import 'package:appinio_code_challenge/data/service/weather_service.dart';
import 'package:appinio_code_challenge/presentation/pages/weather_forecast_page.dart';
import 'package:appinio_code_challenge/presentation/widget/weather_item.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:appinio_code_challenge/data/mock_data/mock_forecast_data.dart';

class MockWeatherService extends Mock implements ChopperWeatherService {}

class MockLocationService extends Mock implements LocationService {}

class MockWeatherCubit extends MockCubit<WeatherState> implements WeatherCubit {
}

void main() {
  group('weather forecast page', () {
    late WeatherCubit weatherCubit;
    ForecastData data = ForecastData.fromJson(mockForecastData);

    setUp(() {
      weatherCubit = MockWeatherCubit();
    });

    testWidgets('weather forecast page show correct data from state',
        (tester) async {
      when(() => weatherCubit.state).thenReturn(WeatherLoadedState(
          cityName: 'Amberg', data: data));
      await tester.pumpWidget(BlocProvider.value(
        value: weatherCubit,
        child: const MaterialApp(home: WeatherForecastPage()),
      ));
      expect(find.text('Amberg'), findsOneWidget);
      expect(find.byType(WeatherItem), findsNWidgets(3));
    });

    testWidgets('weather forecast page show Error Text when Error happens',
        (tester) async {
      when(() => weatherCubit.state)
          .thenReturn(const WeatherErrorState(errorMessage: "Error!"));
      await tester.pumpWidget(BlocProvider.value(
        value: weatherCubit,
        child: const MaterialApp(home: WeatherForecastPage()),
      ));
      expect(find.text('something went wrong!'), findsOneWidget);
    });

    testWidgets(
        'weather forecast page show Loading indicator when Data is loading',
        (tester) async {
      when(() => weatherCubit.state).thenReturn(const WeatherLoadingState());
      await tester.pumpWidget(BlocProvider.value(
        value: weatherCubit,
        child: const MaterialApp(home: WeatherForecastPage()),
      ));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('weather Item has a sunny icon when weather is sunny',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: WeatherItem(data.dataseries.first, data.init)),
      );
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is FaIcon && widget.icon == Icons.sunny),
          findsOneWidget);
    });
  });
}
