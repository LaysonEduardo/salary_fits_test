import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../common/app_exception.dart';
import '../models/location/location.dart';
import '../models/weather/open_weather_model.dart';
import '../services/http/base/http_services.dart';
import 'endpoints.dart';

class WeatherRepository {
  static final HttpServices _http = Modular.get<HttpServices>();

  static Future<OpenWeatherModel> fetchToday({
    required Location currentLocation,
    required String unit,
  }) async {
    final Response result = await _http.get(
      Endpoints.weatherToday(location: currentLocation, metric: unit),
    );
    return OpenWeatherModel.fromJson(result.data);
  }

  static Future<List<OpenWeatherModel>> fechNextDays({
    required Location currentLocation,
    required String unit,
  }) async {
    final List<OpenWeatherModel> weathers = [];
    final Response result = await _http.get(
      Endpoints.nextDays(location: currentLocation, metric: unit),
    );
    for (final json in result.data['list']) {
      if (json['dt_txt'].contains('12:00:00')) {
        weathers.add(OpenWeatherModel.fromJson(json));
      }
    }
    return weathers;
  }
}
