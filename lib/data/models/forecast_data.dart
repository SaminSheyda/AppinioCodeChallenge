import 'package:json_annotation/json_annotation.dart';

part 'forecast_data.g.dart';

/// product : "astro"
/// init : "2022070306"
/// dataseries : [{"timepoint":3,"cloudcover":9,"seeing":8,"transparency":5,"lifted_index":-1,"rh2m":12,"wind10m":{"direction":"S","speed":3},"temp2m":28,"prec_type":"rain"},{"timepoint":6,"cloudcover":9,"seeing":8,"transparency":5,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"S","speed":3},"temp2m":27,"prec_type":"rain"},{"timepoint":9,"cloudcover":9,"seeing":8,"transparency":5,"lifted_index":-1,"rh2m":12,"wind10m":{"direction":"S","speed":3},"temp2m":26,"prec_type":"rain"},{"timepoint":12,"cloudcover":9,"seeing":8,"transparency":6,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"S","speed":3},"temp2m":26,"prec_type":"rain"},{"timepoint":15,"cloudcover":9,"seeing":8,"transparency":7,"lifted_index":-1,"rh2m":14,"wind10m":{"direction":"SE","speed":3},"temp2m":25,"prec_type":"rain"},{"timepoint":18,"cloudcover":9,"seeing":7,"transparency":7,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"S","speed":2},"temp2m":26,"prec_type":"rain"},{"timepoint":21,"cloudcover":9,"seeing":8,"transparency":7,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"S","speed":2},"temp2m":26,"prec_type":"rain"},{"timepoint":24,"cloudcover":9,"seeing":7,"transparency":7,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"S","speed":3},"temp2m":26,"prec_type":"rain"},{"timepoint":27,"cloudcover":9,"seeing":7,"transparency":8,"lifted_index":-1,"rh2m":14,"wind10m":{"direction":"S","speed":3},"temp2m":25,"prec_type":"rain"},{"timepoint":30,"cloudcover":9,"seeing":8,"transparency":7,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"SE","speed":3},"temp2m":25,"prec_type":"rain"},{"timepoint":33,"cloudcover":9,"seeing":8,"transparency":8,"lifted_index":-1,"rh2m":14,"wind10m":{"direction":"SE","speed":2},"temp2m":25,"prec_type":"rain"},{"timepoint":36,"cloudcover":9,"seeing":8,"transparency":7,"lifted_index":-1,"rh2m":14,"wind10m":{"direction":"SE","speed":2},"temp2m":25,"prec_type":"rain"},{"timepoint":39,"cloudcover":9,"seeing":8,"transparency":7,"lifted_index":-1,"rh2m":14,"wind10m":{"direction":"SE","speed":2},"temp2m":25,"prec_type":"rain"},{"timepoint":42,"cloudcover":9,"seeing":6,"transparency":8,"lifted_index":-1,"rh2m":14,"wind10m":{"direction":"SE","speed":2},"temp2m":25,"prec_type":"rain"},{"timepoint":45,"cloudcover":9,"seeing":6,"transparency":7,"lifted_index":-4,"rh2m":12,"wind10m":{"direction":"S","speed":2},"temp2m":26,"prec_type":"rain"},{"timepoint":48,"cloudcover":9,"seeing":6,"transparency":4,"lifted_index":-4,"rh2m":10,"wind10m":{"direction":"S","speed":3},"temp2m":30,"prec_type":"rain"},{"timepoint":51,"cloudcover":9,"seeing":7,"transparency":5,"lifted_index":-4,"rh2m":12,"wind10m":{"direction":"S","speed":3},"temp2m":29,"prec_type":"rain"},{"timepoint":54,"cloudcover":9,"seeing":8,"transparency":6,"lifted_index":-4,"rh2m":13,"wind10m":{"direction":"SE","speed":3},"temp2m":27,"prec_type":"rain"},{"timepoint":57,"cloudcover":9,"seeing":7,"transparency":8,"lifted_index":-4,"rh2m":14,"wind10m":{"direction":"S","speed":3},"temp2m":26,"prec_type":"rain"},{"timepoint":60,"cloudcover":9,"seeing":7,"transparency":8,"lifted_index":-4,"rh2m":14,"wind10m":{"direction":"S","speed":2},"temp2m":26,"prec_type":"rain"},{"timepoint":63,"cloudcover":9,"seeing":8,"transparency":8,"lifted_index":-4,"rh2m":14,"wind10m":{"direction":"SE","speed":2},"temp2m":25,"prec_type":"none"},{"timepoint":66,"cloudcover":9,"seeing":6,"transparency":8,"lifted_index":-4,"rh2m":13,"wind10m":{"direction":"E","speed":2},"temp2m":26,"prec_type":"rain"},{"timepoint":69,"cloudcover":9,"seeing":8,"transparency":5,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"NE","speed":2},"temp2m":27,"prec_type":"rain"},{"timepoint":72,"cloudcover":9,"seeing":7,"transparency":6,"lifted_index":-1,"rh2m":13,"wind10m":{"direction":"SE","speed":2},"temp2m":27,"prec_type":"rain"}]

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
class ForecastData {
  ForecastData({
    required this.init,
    required this.dataseries,
    this.product,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    var list = json['dataseries'] as List;
    List<Dataseries> itemsList =
        list.map((i) => Dataseries.fromJsonData(i, json['init'])).toList();
    return ForecastData(
      product: json['dataseries'],
      init: json['init'],
      dataseries: itemsList,
    );
  }

  String? product;
  String init;
  List<Dataseries> dataseries;
}

/// timepoint : 3
/// cloudcover : 9
/// seeing : 8
/// transparency : 5
/// lifted_index : -1
/// rh2m : 12
/// wind10m : {"direction":"S","speed":3}
/// temp2m : 28
/// prec_type : "rain"

@JsonSerializable()
class Dataseries {
  /// constructor
  Dataseries({
    required this.timepoint,
    this.cloudcover,
    this.seeing,
    this.transparency,
    this.liftedIndex,
    this.rh2m,
    this.wind10m,
    this.temp2m,
    this.precType,
  });

  factory Dataseries.fromJsonData(Map<String, dynamic> json,String init) {
    DateTime timpePoint = _getDateTime(init, json['timepoint'] as int);

    return Dataseries(
      timepoint: timpePoint,
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
  }

  DateTime timepoint;
  int? cloudcover;
  int? seeing;
  int? transparency;
  int? liftedIndex;
  int? rh2m;
  Wind10m? wind10m;
  int? temp2m;
  String? precType;

  Map<String, dynamic> toJson() => _$DataseriesToJson(this);
}

/// direction : "S"
/// speed : 3

@JsonSerializable()
class Wind10m {
  Wind10m({
    this.direction,
    this.speed,
  });

  String? direction;
  int? speed;

  factory Wind10m.fromJson(Map<String, dynamic> json) =>
      _$Wind10mFromJson(json);

  Map<String, dynamic> toJson() => _$Wind10mToJson(this);
}

/// get the  date and time from init value
DateTime _getDateTime(String init, int timePoint) {
  final stringDate = init.substring(0, 8);
  final initTime = int.parse(init.substring(8));
  DateTime dateTime = DateTime.parse(stringDate);

  /// add current time zone to the date
  final Duration timezoneOffset = DateTime.now().timeZoneOffset;

  return dateTime
      .add(Duration(hours: timePoint + initTime))
      .add(timezoneOffset);
}
