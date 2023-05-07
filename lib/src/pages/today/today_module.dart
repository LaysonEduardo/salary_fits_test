import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/pages/today/bloc/today_bloc.dart';
import 'package:salary_fits_test/src/pages/today/today_page.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';

class TodayModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((_) => TodayBloc(Modular.get<WeatherManagement>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const TodayPage())),
      ];
}
