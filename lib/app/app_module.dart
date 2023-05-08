import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';
import '../src/modules/home/home_module.dart';
import '../src/modules/language/bloc/app_language_bloc.dart';
import '../src/services/http/dio_services.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind.singleton((i) => DioServices(Dio())),
      Bind.singleton((i) => WeatherManagement()),
      Bind.singleton((i) => AppLanguageBloc()),
    ];
  }

  @override
  List<ModularRoute> get routes {
    return [
      ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ];
  }
}
