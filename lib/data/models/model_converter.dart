import 'dart:convert';
import 'package:appinio_code_challenge/data/models/forecast_data.dart';
import 'package:chopper/chopper.dart';

///Model Convertor
class ModelConvertor extends JsonConverter {
  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(
          Response<dynamic> response) =>
      response.copyWith(
        body: fromJsonData<BodyType, InnerType>(response.body),
      );

  ///fromJsonData
  T fromJsonData<T, InnerType>(String jsonData) {
    final dynamic jsonMap = json.decode(jsonData);
    final List<dynamic>? items = jsonMap['dataseries'];
    if (items == null) {
      return ForecastData.fromJson(jsonMap) as T;
    }

    List<Dataseries> itemsList = items
        .map((i) => Dataseries.fromJsonData(
              i,
              jsonMap['init'],
            ))
        .toList();

    return ForecastData(
      product: jsonMap['product'],
      init: jsonMap['init'],
      dataseries: itemsList,
    ) as T;
  }
}
