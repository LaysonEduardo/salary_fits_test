import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/app/app_module.dart';
import 'app/app_widget.dart';
import 'src/services/UI/ui_services.dart';

void main() async {
  print('test');
  await UIServices.init();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const WeatherApp(),
    ),
  );
}
