import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';
import '../events/today_events.dart';
import '../state/today_state.dart';

class TodayBloc extends Bloc<TodayEvents, TodayState> {
  final WeatherManagement weather;
  TodayBloc(this.weather) : super(TodayLoadingState()) {
    on<FetchWeather>(
      (event, emit) async {
        await weather.init();
        if (weather.hasValidToday) {
          emit(
            TodaySuccessState(
              location: weather.currentLocation!,
              todayWeather: weather.todayWeather!,
              date: DateFormat.yMMMMEEEEd().format(DateTime.now()),
              state: weather.state,
            ),
          );
        } else {
          emit(
            TodayFailState(),
          );
        }
      },
    );
  }
}
