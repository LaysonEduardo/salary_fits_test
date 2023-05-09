import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';
import '../events/home_events.dart';
import '../state/home_state.dart';

HomeBloc homeBloc = Modular.get<HomeBloc>();

class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final WeatherManagement weather;
  HomeBloc(this.weather) : super(HomeFirstLoadingState()) {
    on<FetchToday>(
      (event, emit) async {
        await weather.init();
        if (weather.hasValidToday) {
          emit(
            HomeSuccessState(
              location: weather.currentLocation!,
              todayWeather: weather.todayWeather!,
              date: DateFormat.yMMMMEEEEd().format(DateTime.now()),
              weatherState: weather.state,
              lastUpdate: DateFormat.Hm().format(DateTime.now()),
            ),
          );
        } else {
          emit(
            HomeFailState(),
          );
        }
      },
    );

    on<UpdateToday>((event, emit) async {
      emit(HomeFirstLoadingState());
      await weather.init();
      await weather.fetchToday().then((_) {
        emit(
          HomeSuccessState(
            location: weather.currentLocation!,
            todayWeather: weather.todayWeather!,
            date: DateFormat.yMMMMEEEEd().format(DateTime.now()),
            weatherState: weather.state,
            lastUpdate: DateFormat.Hm().format(DateTime.now()),
          ),
        );
      });
    });
  }
}
