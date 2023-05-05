import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/modules/app_module.dart';
import 'src/modules/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const WeatherApp()));
}
