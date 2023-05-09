import 'package:geolocator/geolocator.dart';
import 'package:salary_fits_test/src/modules/language/bloc/app_language_bloc.dart';

import '../models/location/location.dart';
import '../modules/language/language.dart';

class Endpoints {
  Endpoints._();
  static const String baseURL = 'https://api.openweathermap.org';
  static const String _appID = 'dbcadc34a5cf5d53decf099c7ad40195';

  static String weatherToday(
      {required Location location, required String metric}) {
    return '/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}${appIdentity()}&units=$metric&lang=${appLanguageBloc.state.selectedLanguage?.value ?? deviceLanguage().value}';
  }

  static String nextDays({required Location location, required String metric}) {
    return '/data/2.5/forecast?lat=${location.latitude}&lon=${location.longitude}&units=$metric${appIdentity()}&lang=${appLanguageBloc.state.selectedLanguage?.value ?? deviceLanguage().value}';
  }

  static String geoCoding({required Position positon}) {
    return '/geo/1.0/reverse?lat=${positon.latitude}&lon=${positon.longitude}&limit=1${appIdentity()}';
  }

  static String appIdentity() {
    return '&appid=$_appID';
  }
}
