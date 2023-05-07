import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';
import '../events/today_events.dart';
import '../state/today_state.dart';

class TodayBloc extends Bloc<TodayEvents, TodayState> {
  final WeatherManagement weather;
  TodayBloc(this.weather) : super(TodayFirstLoadingState()) {
    on<FetchToday>(
      (event, emit) async {
        await weather.init();
        if (weather.hasValidToday) {
          emit(
            TodaySuccessState(
              location: weather.currentLocation!,
              todayWeather: weather.todayWeather!,
              date: DateFormat.yMMMMEEEEd().format(DateTime.now()),
              state: weather.state,
              lastUpdate: DateFormat.Hm().format(DateTime.now()),
            ),
          );
        } else {
          emit(
            TodayFailState(),
          );
        }
      },
    );

    on<UpdateToday>((event, emit) async {
      await weather.fetchToday().then((_) {
        emit(
          TodaySuccessState(
            location: weather.currentLocation!,
            todayWeather: weather.todayWeather!,
            date: DateFormat.yMMMMEEEEd().format(DateTime.now()),
            state: weather.state,
            lastUpdate: DateFormat.Hm().format(DateTime.now()),
          ),
        );
      });
    });
  }
}
