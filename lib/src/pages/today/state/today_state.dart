import 'package:salary_fits_test/src/services/weather/weather_state.dart';

import '../../../models/location/location.dart';
import '../../../models/weather/open_weather_model.dart';

abstract class TodayState {
  TodayState();
}

class TodayLoadingState extends TodayState {
  TodayLoadingState() : super();
}

class TodaySuccessState extends TodayState {
  Location location;
  OpenWeatherModel todayWeather;
  WeatherState state;
  String date;

  TodaySuccessState({
    required this.location,
    required this.todayWeather,
    required this.date,
    required this.state,
  }) : super();
}

class TodayFailState extends TodayState {
  TodayFailState() : super();
}
