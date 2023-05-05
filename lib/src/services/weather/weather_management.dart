import 'package:salary_fits_test/src/services/weather/weather_state.dart';

class WeatherManagement {
  WeatherState state;
  WeatherManagement({this.state = WeatherState.unknown});

  Future<void> updateToday() async {}

  Future<void> fechToday() async {}

  Future<void> updateNextDays() async {}

  Future<void> fechNextDays() async {}
}
