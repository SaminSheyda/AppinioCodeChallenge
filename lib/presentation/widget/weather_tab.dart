import 'package:appinio_code_challenge/bloc/weather_cubit.dart';
import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:appinio_code_challenge/presentation/helpers/temp_helper.dart';
import 'package:appinio_code_challenge/presentation/pages/weather_forecast_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

/// Weather tab
class WeatherTab extends StatelessWidget {
  const WeatherTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: RefreshIndicator(
          onRefresh: () => _refreshData(context),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                WeatherForecastPage.routeName
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: BlocBuilder<WeatherCubit, WeatherState>(
                    builder: (_, WeatherState state) {
                      if (state is WeatherLoadedState) {
                        final int currentTemp=_getCurrentTemp(state.data.dataseries);
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
                                        MediaQuery.of(context).size.height *
                                            0.06,
                                    fontWeight: FontWeight.bold,
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
                                  '${(_getCurrentTemp(state.data.dataseries))}˚C',
                                  //curent temperature
                                  style: GoogleFonts.questrial(
                                    color: getTempColor(currentTemp),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.13,
                                  ),
                                ),
                              ),
                            ),
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
                      return Center(
                          child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('something went wrong!'),
                          IconButton(
                            icon: Icon(
                              Icons.refresh,
                              size: MediaQuery.of(context).size.width * 0.15,
                            ),
                            onPressed: () => _refreshData(context),
                          )
                        ],
                      ));
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  Future<void> _refreshData(BuildContext context) async {
    BlocProvider.of<WeatherCubit>(context).getWeatherData();
  }

  /// get the  temp that is close to current time
  int _getCurrentTemp(List<Dataseries> data) {
    for (int i = 0; i < data.length; i++) {
      if (data[i].timepoint.difference(DateTime.now()) <
          const Duration(hours: 3)) {
        return data[i].temp2m?? 0;
      }
    }
    return 0;
  }
}
