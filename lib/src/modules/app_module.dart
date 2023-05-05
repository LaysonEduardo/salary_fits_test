import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';

import '../pages/today/today_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [Bind.singleton((i) => WeatherManagement())];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => TodayPage()),
      ];
}
