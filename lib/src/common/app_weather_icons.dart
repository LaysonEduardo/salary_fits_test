import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/services/time/time_services.dart';

import '../services/weather/weather_state.dart';

class AppWeatherIcons {
  static Widget humidity({double size = 150}) {
    return Image.asset(
      'assets/icons/humidity.png',
      width: size,
    );
  }

  static Widget wind({double size = 150}) {
    return Image.asset(
      'assets/icons/wind.png',
      width: size,
    );
  }

  static Widget weatherIcon({
    required WeatherState weatherState,
    double size = 150,
  }) {
    switch (weatherState) {
      case WeatherState.clearSky:
        return TimeServices.isDay()
            ? Image.asset(
                'assets/icons/clear_day.png',
                width: size,
              )
            : Image.asset(
                'assets/icons/clear_night.png',
                width: size,
              );

      case WeatherState.cloudy:
        return Image.asset(
          'assets/icons/cloudy.png',
          width: size,
        );

      case WeatherState.drizzle:
        return Image.asset(
          'assets/icons/rain.png',
          width: size,
        );

      case WeatherState.rain:
        return Image.asset(
          'assets/icons/rain.png',
          width: size,
        );

      case WeatherState.thunderStorm:
        return Image.asset(
          'assets/icons/thunderstorm.png',
          width: size,
        );

      case WeatherState.snow:
        return Image.asset(
          'assets/icons/snow.png',
          width: size,
        );

      default:
        return Image.asset(
          'assets/icons/clear_day.png',
          width: size,
        );
    }
  }
}
