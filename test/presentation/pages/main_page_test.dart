import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:appinio_code_challenge/data/service/location_service.dart';
import 'package:appinio_code_challenge/data/service/weather_service.dart';
import 'package:appinio_code_challenge/presentation/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherService extends Mock implements ChopperWeatherService {}

class MockLocationService extends Mock implements LocationService {}


void main() {

  group('Main Page', () {

    testWidgets('Main page has as tab view with 2 tabs', (tester) async {
        await tester.pumpWidget(BlocProvider.value(
          value: WeatherCubit(MockWeatherService(),MockLocationService()),
          child: const MaterialApp(home: MainPage()),
        ));
      expect(find.byType(TabBarView), findsOneWidget);
      expect(find.byType(Tab), findsNWidgets(2));
    });
  });
}
