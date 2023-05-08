import 'package:salary_fits_test/src/services/weather/weather_state.dart';

import '../../../models/location/location.dart';
import '../../../models/weather/open_weather_model.dart';

abstract class HomeState {
  HomeState();
}

class HomeFirstLoadingState extends HomeState {
  HomeFirstLoadingState() : super();
}

class HomeSuccessState extends HomeState {
  Location location;
  OpenWeatherModel todayWeather;
  WeatherState weatherState;
  String date;
  String lastUpdate;

  HomeSuccessState({
    required this.location,
    required this.todayWeather,
    required this.date,
    required this.weatherState,
    required this.lastUpdate,
  }) : super();
}

class HomeFailState extends HomeState {
  HomeFailState() : super();
}
