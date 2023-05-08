import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/services/time/time_services.dart';

import '../services/weather/weather_state.dart';

class AppWeatherIcons {
  Widget icon(WeatherState weatherState) {
    switch (weatherState) {
      case WeatherState.clearSky:
        return TimeServices.isDay()
            ? Image.asset('assets/icons/clear_day.png')
            : Image.asset('assets/icons/clear_night.png');

      case WeatherState.cloudy:
        return Image.asset('assets/icons/cloudy.png');

      case WeatherState.drizzle:
        return Image.asset('assets/icons/rain.png');

      case WeatherState.rain:
        return Image.asset('assets/icons/rain.png');

      case WeatherState.thunderStorm:
        return Image.asset('assets/icons/thunderstorm.png');

      case WeatherState.snow:
        return Image.asset('assets/icons/snow.png');

      default:
        return Image.asset('assets/icons/clear_sky.png');
    }
  }
}
