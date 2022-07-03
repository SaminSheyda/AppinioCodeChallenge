import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// Weather tab
class WeatherTab extends StatelessWidget {
  const WeatherTab({Key? key}) : super(key: key);
  final currTemp = 10;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.35,
              child: BlocBuilder<WeatherCubit, WeatherState>(
                builder: (BuildContext context, WeatherState state) {
                  if (state is WeatherLoadedState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
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
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.005,
                          ),
                          child: Align(
                            child: Text(
                              'Today', //day
                              style: GoogleFonts.questrial(
                                color: Colors.black54,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.03,
                          ),
                          child: Align(
                            child: Text(
                              '$currTemp˚C', //curent temperature
                              style: GoogleFonts.questrial(
                                color: currTemp <= 0
                                    ? Colors.blue
                                    : currTemp > 0 && currTemp <= 15
                                        ? Colors.indigo
                                        : currTemp > 15 && currTemp < 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.13,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is WeatherLoadingState) {
                    return const Center(
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }
                  return Center(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('something went wrong!'),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () {
                          BlocProvider.of<WeatherCubit>(context)
                              .getWeatherData();
                        },
                      )
                    ],
                  ));
                },
              ),
            ),
          ),
        ),
      );
}
