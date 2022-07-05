// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dataseries _$DataseriesFromJson(Map<String, dynamic> json) => Dataseries(
      timepoint: DateTime.parse(json['timepoint'] as String),
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
      'timepoint': instance.timepoint.toIso8601String(),
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
