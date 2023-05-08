import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';

class DynamicBottom extends StatelessWidget {
  final WeatherManagement weather = Modular.get<WeatherManagement>();
  DynamicBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                weather.state == WeatherState.snow
                    ? 'assets/background_objects/snow_ground.png'
                    : 'assets/background_objects/ground.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
