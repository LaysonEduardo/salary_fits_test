import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/modules/language/language.dart';
import 'package:salary_fits_test/src/modules/language/state/app_language_event.dart';
import '../src/modules/language/bloc/app_language_bloc.dart';
import '../src/modules/language/events/app_language_state.dart';
import '../src/services/http/base/http_services.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  final HttpServices http = Modular.get<HttpServices>();
  @override
  void initState() {
    http.init();
    Intl.defaultLocale = Platform.localeName;
    appLanguageBloc.add(ChangeLanguage(selectedLanguage: deviceLanguage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppLanguageBloc, LanguageState>(
      bloc: appLanguageBloc,
      builder: (context, state) {
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
          locale: state.selectedLanguage?.value ?? deviceLanguage().value,
          supportedLocales: const [
            Locale('en'),
            Locale('pt'),
          ],
        );
      },
    );
  }
}
