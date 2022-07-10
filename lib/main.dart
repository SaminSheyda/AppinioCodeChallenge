import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:appinio_code_challenge/data/service/location_service.dart';
import 'package:appinio_code_challenge/data/service/weather_service.dart';
import 'package:appinio_code_challenge/presentation/pages/main_page.dart';
import 'package:appinio_code_challenge/presentation/pages/splash_page.dart';
import 'package:appinio_code_challenge/presentation/pages/weather_forecast_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _weatherCubit =
      WeatherCubit(ChopperWeatherService(), LocationService());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.routeName,
        routes: <String, WidgetBuilder>{
          SplashPage.routeName: (BuildContext context) => const SplashPage(),
          MainPage.routeName: (BuildContext context) => BlocProvider.value(
                value: _weatherCubit,
                child: const MainPage(),
              ),
          WeatherForecastPage.routeName: (BuildContext context) =>
              BlocProvider.value(
                value: _weatherCubit,
                child: const WeatherForecastPage(),
              ),
        });
  }

  @override
  void dispose() {
    _weatherCubit.close();
    super.dispose();
  }
}
