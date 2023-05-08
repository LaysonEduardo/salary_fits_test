import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/modules/home/bloc/home_bloc.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory((_) => HomeBloc(Modular.get<WeatherManagement>())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) => const HomePage())),
      ];
}
