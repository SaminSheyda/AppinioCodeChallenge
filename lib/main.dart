import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:appinio_code_challenge/presentation/pages/main_page.dart';
import 'package:appinio_code_challenge/presentation/pages/splash_page.dart';
import 'package:appinio_code_challenge/presentation/pages/weather_forecast_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
          SplashPage.routeName:(BuildContext context)=>SplashPage(),
          MainPage.routeName: (BuildContext context) => BlocProvider(
                create: (context) => WeatherCubit(),
                child: const MainPage(),
              ),
          WeatherForecastPage.routeName: (BuildContext context) => BlocProvider(
            create: (context) => WeatherCubit(),
            child: const WeatherForecastPage(),
          ),
        });
  }
}
