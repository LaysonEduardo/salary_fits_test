import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/services/time/time_services.dart';

import '../services/weather/weather_state.dart';

class AppWeatherIcons {
  static Widget humidity({double size = 150}) {
    return Image.asset('assets/icons/humidity.png');
  }

  static Widget wind({double size = 150}) {
    return Image.asset('assets/icons/wind.png');
  }

  static Widget weatherIcon(
      {required WeatherState weatherState, double size = 150}) {
    switch (weatherState) {
      case WeatherState.clearSky:
        return TimeServices.isDay()
            ? Image.asset(
                'assets/icons/clear_day.png',
                width: 150,
              )
            : Image.asset(
                'assets/icons/clear_night.png',
                width: 150,
              );

      case WeatherState.cloudy:
        return Image.asset(
          'assets/icons/cloudy.png',
          width: 150,
        );

      case WeatherState.drizzle:
        return Image.asset(
          'assets/icons/rain.png',
          width: 150,
        );

      case WeatherState.rain:
        return Image.asset(
          'assets/icons/rain.png',
          width: 150,
        );

      case WeatherState.thunderStorm:
        return Image.asset(
          'assets/icons/thunderstorm.png',
          width: 150,
        );

      case WeatherState.snow:
        return Image.asset(
          'assets/icons/snow.png',
          width: 150,
        );

      default:
        return Image.asset(
          'assets/icons/clear_sky.png',
          width: 150,
        );
    }
  }
}
