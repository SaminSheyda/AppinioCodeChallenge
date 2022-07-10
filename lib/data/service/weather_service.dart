import 'package:appinio_code_challenge/data/mock_data/mock_forecast_data.dart';
import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:appinio_code_challenge/data/models/model_converter.dart';
import 'package:chopper/chopper.dart';


part 'weather_service.chopper.dart';

/// InvestmentService
@ChopperApi()
abstract class WeatherService extends ChopperService {
  /// create WeatherService
  static WeatherService create(ChopperClient client) =>
      _$WeatherService(client);

  /// get weather
  @Get(path: '/bin/astro.php')
  Future<Response<dynamic>> getWeather(
      @Query('lon') double lon, @Query('lat') double lat);
}

class ChopperWeatherService {
  /// Initialized [ChopperWeatherService]
  factory ChopperWeatherService() => ChopperWeatherService._internal();

  ChopperWeatherService._internal() {
    final ChopperClient client = ChopperClient(
      baseUrl: 'https://www.7timer.info',
      interceptors: <dynamic>[_addQuery, HttpLoggingInterceptor()],
      converter: ModelConvertor(),
      errorConverter: const JsonConverter(),
      services: <ChopperService>[WeatherService.create(ChopperClient())],
    );

    _weatherService = client.getService<WeatherService>();
  }

  late final WeatherService _weatherService;

  Future<ForecastData> getWeather(double lon, double lat) async {
    final Response<dynamic> response =
        await _weatherService.getWeather(lon, lat);

    return response.body;
  }
}

///add Query
Request _addQuery(Request req) {
  final Map<String, dynamic> params = Map<String, dynamic>.from(req.parameters);
  params['output'] = 'json';
  params['unit'] = 'metric';
  params['tzshift'] = '0';
  return req.copyWith(parameters: params);
}

/// Mock of Base Weather Service
class MockWeatherService implements WeatherService {
  @override
  Future<Response> getWeather(double lon, double lat) async =>
      Future<Response>.delayed(const Duration(milliseconds: 1000)).whenComplete(() {
       ForecastData.fromJson(mockForecastData);
      });

  @override
  ChopperClient client = ChopperClient();

  @override
  // TODO: implement definitionType
  Type get definitionType => throw UnimplementedError();
}
