import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/models/location/location.dart';
import 'package:salary_fits_test/src/models/weather/open_weather_model.dart';
import 'package:salary_fits_test/src/repository/endpoints.dart';
import 'package:salary_fits_test/src/services/geolocator/location_service.dart';
import 'package:salary_fits_test/src/services/http/base/http_services.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';

class WeatherManagement {
  WeatherState state;
  Location? currentLocation;
  OpenWeatherModel? todayWeather;
  List<OpenWeatherModel> nextDaysWeather = [];

  bool useCelsius = true;

  String get _unit => useCelsius ? 'metric' : 'imperial';

  final HttpServices http = Modular.get<HttpServices>();
  final Endpoints endpoints = Endpoints();

  WeatherManagement({
    this.state = WeatherState.unknown,
  });

  Future<void> init() async {
    currentLocation = await LocationService.getCurrentLocation();
    await fetchToday();
    await fechNextDays();
    setWeatherState();
  }

  Future<void> fetchToday() async {
    if (currentLocation != null) {
      final Response result = await http.get(
        endpoints.weatherToday(location: currentLocation!, metric: _unit),
      );
      todayWeather = OpenWeatherModel.fromJson(result.data);
    }
  }

  bool get hasValidToday => (currentLocation != null && todayWeather != null);

  bool get hasValidNextDays => nextDaysWeather.isNotEmpty;

  Future<void> fechNextDays() async {
    if (currentLocation != null) {
      final Response result = await http.get(
        endpoints.nextDays(location: currentLocation!, metric: _unit),
      );
      if (result.statusCode == 200) {
        nextDaysWeather.clear();
        for (final json in result.data['list']) {
          nextDaysWeather.add(OpenWeatherModel.fromJson(json));
        }
      }
    }
  }

  void setWeatherState() {
    if (todayWeather != null) {
      switch (todayWeather!.weather.first.main) {
        case 'Clear':
          state = WeatherState.clearSky;
          break;

        case 'Clouds':
          state = WeatherState.cloudy;
          break;

        case 'Drizzle':
          state = WeatherState.drizzle;
          break;

        case 'Rain':
          state = WeatherState.rain;
          break;

        case 'Snow':
          state = WeatherState.snow;
          break;

        case 'Thunderstorm':
          state = WeatherState.thunderStorm;
          break;

        default:
          WeatherState.unknown;
      }
    }
  }
}
