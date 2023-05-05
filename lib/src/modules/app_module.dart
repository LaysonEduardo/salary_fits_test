import 'package:flutter_modular/flutter_modular.dart';

import '../pages/today/today_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => TodayPage()),
      ];
}
