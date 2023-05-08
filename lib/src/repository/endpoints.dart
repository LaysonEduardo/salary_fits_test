import 'package:geolocator/geolocator.dart';
import 'package:salary_fits_test/src/modules/language/bloc/app_language_bloc.dart';

import '../models/location/location.dart';
import '../modules/language/language.dart';

class Endpoints {
  // Endpoints._();
  final String baseURL = 'https://api.openweathermap.org';
  final String appID = 'dbcadc34a5cf5d53decf099c7ad40195';

  String weatherToday({required Location location, required String metric}) {
    return '/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}${appIdentity()}&units=$metric&lang=${appLanguageBloc.state.selectedLanguage ?? deviceLanguage().value}';
  }

  String nextDays({required String lat, required String lon}) {
    return '/data/2.5/forecast?lat=$lat&lon=$lon${appIdentity()}';
  }

  String geoCoding({required Position positon}) {
    return '/geo/1.0/reverse?lat=${positon.latitude}&lon=${positon.longitude}&limit=1${appIdentity()}';
  }

  String appIdentity() {
    return '&appid=$appID';
  }
}
