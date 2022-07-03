// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastData _$ForecastDataFromJson(Map<String, dynamic> json) => ForecastData(
      product: json['product'] as String?,
      init: json['init'] as String?,
      dataseries: (json['dataseries'] as List<dynamic>?)
          ?.map((e) => Dataseries.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastDataToJson(ForecastData instance) =>
    <String, dynamic>{
      'product': instance.product,
      'init': instance.init,
      'dataseries': instance.dataseries,
    };

Dataseries _$DataseriesFromJson(Map<String, dynamic> json) => Dataseries(
      timepoint: json['timepoint'] as int?,
      cloudcover: json['cloudcover'] as int?,
      seeing: json['seeing'] as int?,
      transparency: json['transparency'] as int?,
      liftedIndex: json['liftedIndex'] as int?,
      rh2m: json['rh2m'] as int?,
      wind10m: json['wind10m'] == null
          ? null
          : Wind10m.fromJson(json['wind10m'] as Map<String, dynamic>),
      temp2m: json['temp2m'] as int?,
      precType: json['precType'] as String?,
    );

Map<String, dynamic> _$DataseriesToJson(Dataseries instance) =>
    <String, dynamic>{
      'timepoint': instance.timepoint,
      'cloudcover': instance.cloudcover,
      'seeing': instance.seeing,
      'transparency': instance.transparency,
      'liftedIndex': instance.liftedIndex,
      'rh2m': instance.rh2m,
      'wind10m': instance.wind10m,
      'temp2m': instance.temp2m,
      'precType': instance.precType,
    };

Wind10m _$Wind10mFromJson(Map<String, dynamic> json) => Wind10m(
      direction: json['direction'] as String?,
      speed: json['speed'] as int?,
    );

Map<String, dynamic> _$Wind10mToJson(Wind10m instance) => <String, dynamic>{
      'direction': instance.direction,
      'speed': instance.speed,
    };
