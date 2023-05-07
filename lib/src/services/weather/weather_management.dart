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
  List<OpenWeatherModel> nextDays = [];

  bool useCelsius = true;

  String get metric => useCelsius ? 'metric' : 'imperial';

  final HttpServices http = Modular.get<HttpServices>();
  final Endpoints endpoints = Endpoints();

  WeatherManagement({
    this.state = WeatherState.unknown,
  });

  Future<void> init() async {
    currentLocation = await LocationService.getCurrentLocation();
    await fetchToday();
    setWeatherState();
  }

  Future<void> fetchToday() async {
    if (currentLocation != null) {
      final Response result = await http.get(
        endpoints.weatherToday(location: currentLocation!, metric: metric),
      );
      todayWeather = OpenWeatherModel.fromJson(result.data);
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

        case 'Rain	':
          state = WeatherState.rain;
          break;

        case 'Thunderstorm':
          state = WeatherState.thunderStorm;
          break;

        default:
          WeatherState.unknown;
      }
    }
  }

  Future<void> fetchLocation() async {
    if (currentLocation != null) {
      final Response result = await http.get(
        endpoints.weatherToday(location: currentLocation!, metric: metric),
      );
      todayWeather = OpenWeatherModel.fromJson(result.data);
    }
  }

  bool get hasValidToday => (currentLocation != null && todayWeather != null);

  bool get hasValidNextDays => nextDays.isNotEmpty;

  Future<void> updateNextDays() async {}

  Future<void> fechNextDays() async {}
}
