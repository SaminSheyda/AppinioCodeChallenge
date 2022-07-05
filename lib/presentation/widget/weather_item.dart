import 'package:appinio_code_challenge/data/models/constants.dart';
import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:appinio_code_challenge/presentation/helpers/temp_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

/// weather item widget
class WeatherItem extends StatelessWidget {
  /// constructor
  const WeatherItem(this.data, this.init, {Key? key}) : super(key: key);
  final Dataseries data;
  final String init;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: buildForecast(data.timepoint, data.temp2m, data.wind10m?.speed,
          data.rh2m, MediaQuery.of(context).size * 0.9),
    );
  }

  Widget buildForecast(
      DateTime time, int? temp, int? wind, int? rainChance, Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Text(
            DateFormat('MM/dd').format(time),
            style: GoogleFonts.questrial(
              fontSize: size.height * 0.02,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            DateFormat('HH:mm').format(time),
            style: GoogleFonts.questrial(
              fontSize: size.height * 0.04,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                ),
                child: FaIcon(
                  _getWeatherIcon(data, size),
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: getTempColor(temp!),
              fontSize: size.height * 0.035,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            windSpeed[wind! - 1],
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  Icons.water_drop,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            humidity[rainChance! + 4],
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  IconData? _getWeatherIcon(Dataseries? data, Size size) {
    if (data!.precType == 'snow') {
      return Icons.cloudy_snowing;
    } else if (data.precType == 'rain') {
      return FontAwesomeIcons.cloudRain;
    } else {
      if (data.cloudcover! <= 3) {
        if (int.parse(DateFormat('HH').format(data.timepoint)) >= 20 ||
            int.parse(DateFormat('HH').format(data.timepoint)) <= 6) {
          return Icons.nightlight;
        }
        return Icons.sunny;
      } else if (data.cloudcover! >= 7) {
        return Icons.cloud;
      } else if (data.cloudcover! < 7 && data.cloudcover! > 3) {
        return FontAwesomeIcons.cloudSun;
      }
    }
    return null;
  }
}
