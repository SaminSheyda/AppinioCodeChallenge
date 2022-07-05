import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:appinio_code_challenge/presentation/widget/weather_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// Weather Forecast Page
class WeatherForecastPage extends StatelessWidget {
  /// constructor
  const WeatherForecastPage({Key? key}) : super(key: key);
  static const String routeName = 'WeatherForecastPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (BuildContext context, WeatherState state) {
            if (state is WeatherLoadedState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.03,
                    ),
                    child: Align(
                      child: Text(
                        state.cityName,
                        style: GoogleFonts.questrial(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.height * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: state.data.dataseries.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return WeatherItem(
                              state.data.dataseries[index], state.data.init);
                        },
                      ),
                    ),
                  )
                ],
              );
            } else if (state is WeatherLoadingState) {
              return Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  height: MediaQuery.of(context).size.width * 0.15,
                  child: const CircularProgressIndicator(),
                ),
              );
            }
            return const Center(
              child: Text('something went wrong!'),
            );
          },
        )),
      ),
    );
  }
}
