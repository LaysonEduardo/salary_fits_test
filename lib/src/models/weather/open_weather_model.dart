class OpenWeatherModel {
  List<Weather> weather;
  Main main;
  Wind wind;
  String isoCode;
  OpenWeatherModel(
      {required this.weather,
      required this.main,
      required this.wind,
      required this.isoCode});

  factory OpenWeatherModel.fromJson(Map<String, dynamic> json) {
    return OpenWeatherModel(
      weather: (json['weather'] as List)
          .map((weatherJson) => Weather.fromJson(weatherJson))
          .toList(),
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      isoCode: json['sys']['country'],
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
      temp: json['temp'],
      feelsLike: json['feels_like'],
      tempMin: json['temp_min'],
      tempMax: json['temp_max'],
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
      speed: json['speed'],
      deg: json['deg'],
    );
  }
}
