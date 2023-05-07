import 'package:salary_fits_test/src/services/weather/weather_state.dart';

import '../../../models/location/location.dart';
import '../../../models/weather/open_weather_model.dart';

abstract class TodayState {
  TodayState();
}

class TodayFirstLoadingState extends TodayState {
  TodayFirstLoadingState() : super();
}

class TodaySuccessState extends TodayState {
  Location location;
  OpenWeatherModel todayWeather;
  WeatherState state;
  String date;
  String lastUpdate;

  TodaySuccessState({
    required this.location,
    required this.todayWeather,
    required this.date,
    required this.state,
    required this.lastUpdate,
  }) : super();
}

class TodayFailState extends TodayState {
  TodayFailState() : super();
}
