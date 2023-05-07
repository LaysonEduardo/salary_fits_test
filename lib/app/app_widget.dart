import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import '../src/services/http/base/http_services.dart';
import '../src/services/http/dio_services.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final HttpServices http = Modular.get<DioServices>();
  late String language = Platform.localeName.split('_')[0];
  @override
  void initState() {
    http.init();
    Intl.defaultLocale = Platform.localeName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'MyWeather',
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        I18n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: Locale(language),
      supportedLocales: const [
        Locale('en'),
        Locale('pt'),
      ],
    );
  }
}
