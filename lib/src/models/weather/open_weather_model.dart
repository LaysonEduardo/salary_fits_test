class OpenWeatherModel {
  List<Weather> weather;
  Main main;
  Wind wind;
  int dt;
  OpenWeatherModel({
    required this.weather,
    required this.main,
    required this.wind,
    required this.dt,
  });

  factory OpenWeatherModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherModel(
      weather: (json['weather'] as List)
          .map((weatherJson) => Weather.fromJson(weatherJson))
          .toList(),
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      dt: json["dt"] ?? '',
    );
  }
}

class Main {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  Main({
    required this.temp,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,
    required this.pressure,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: double.parse(json['temp'].toString()),
      feelsLike: double.parse(json['feels_like'].toString()),
      tempMin: double.parse(json['temp_min'].toString()),
      tempMax: double.parse(json['temp_max'].toString()),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}

class Weather {
  int id;
  String main;
  String description;
  String icon;

  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Sys {}

class Wind {
  double speed;
  int deg;

  Wind({
    required this.speed,
    required this.deg,
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: double.parse(json['speed'].toString()),
      deg: json['deg'],
    );
  }
}
