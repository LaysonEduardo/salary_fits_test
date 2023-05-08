import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';

class AppColors {
  static const Color lightBlue = Color(0xff2775ca);
  static const Color mediumBlue = Color(0xff1d5796);
  static const Color darkBlue = Color(0xff133963);

  static accent({required WeatherState weatherState, bool darker = false}) {
    if (weatherState == WeatherState.clearSky) {
      return darker ? AppColors.mediumBlue : AppColors.lightBlue;
    } else if ([
      WeatherState.drizzle,
      WeatherState.cloudy,
    ].contains(weatherState)) {
      return darker
          ? Color(Colors.blueGrey[700]!.value)
          : Color(Colors.blueGrey[600]!.value);
    } else if ([
      WeatherState.rain,
      WeatherState.thunderStorm,
      WeatherState.snow,
    ].contains(weatherState)) {
      return darker
          ? Color(Colors.blueGrey[900]!.value)
          : Color(Colors.blueGrey[800]!.value);
    }
    return AppColors.lightBlue;
  }

  static lighten(WeatherState weatherState) {
    if (weatherState == WeatherState.clearSky) {
      return Color(Colors.blue[200]!.value);
    } else if ([
      WeatherState.drizzle,
      WeatherState.cloudy,
    ].contains(weatherState)) {
      return Color(Colors.grey[400]!.value);
    } else if ([
      WeatherState.rain,
      WeatherState.thunderStorm,
      WeatherState.snow,
    ].contains(weatherState)) {
      return Color(Colors.blueGrey[600]!.value);
    }
    return Color(Colors.blue[200]!.value);
  }
}
