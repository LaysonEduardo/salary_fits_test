import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/common/app_weather_icons.dart';
import 'package:salary_fits_test/src/services/weather/weather_management.dart';
import '../../../../../common/app_colors.dart';
import '../../../../../common/app_fonts.dart';

class WeatherContainer extends StatelessWidget {
  final WeatherManagement management = Modular.get<WeatherManagement>();

  WeatherContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppWeatherIcons.weatherIcon(weatherState: management.state),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                management.todayWeather!.weather.first.description,
                style: const AppFonts.regular(
                  20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${management.todayWeather!.main.temp.round()} ${management.useCelsius ? '°C' : '°F'}',
                style: AppFonts.medium(
                  40,
                  color: AppColors.accent(weatherState: management.state),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
