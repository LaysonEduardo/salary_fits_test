import 'package:salary_fits_test/src/models/location/location.dart';
import 'package:salary_fits_test/src/models/weather/open_weather_model.dart';
import 'package:salary_fits_test/src/repository/weather_repository.dart';
import 'package:salary_fits_test/src/services/geolocator/location_service.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';

class WeatherManagement {
  WeatherState state;
  Location? currentLocation;
  OpenWeatherModel? todayWeather;
  List<OpenWeatherModel> nextDaysWeather = [];
  bool useCelsius = true;
  String get _unit => useCelsius ? 'metric' : 'imperial';

  WeatherManagement({
    this.state = WeatherState.unknown,
  });

  Future<void> init() async {
    currentLocation = await LocationService.getCurrentLocation();
    if (currentLocation != null) {
      todayWeather = await WeatherRepository.fetchToday(
        currentLocation: currentLocation!,
        unit: _unit,
      );
      nextDaysWeather = await WeatherRepository.fechNextDays(
        currentLocation: currentLocation!,
        unit: _unit,
      );
    }
    if (todayWeather != null) {
      state = setWeatherState(todayWeather!.weather.first.main);
    }
  }

  bool get hasValidToday {
    return (currentLocation != null && todayWeather != null);
  }

  bool get hasValidNextDays {
    return currentLocation != null && nextDaysWeather.isNotEmpty;
  }

  WeatherState setWeatherState(String value) {
    switch (value) {
      case 'Clear':
        return WeatherState.clearSky;

      case 'Clouds':
        return WeatherState.cloudy;

      case 'Drizzle':
        return WeatherState.drizzle;

      case 'Rain':
        return WeatherState.rain;

      case 'Snow':
        return WeatherState.snow;

      case 'Thunderstorm':
        return WeatherState.thunderStorm;

      default:
        return WeatherState.unknown;
    }
  }
}
