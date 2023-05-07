import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';

import '../../common/app_colors.dart';
import '../../common/app_fonts.dart';
import '../../models/weather/open_weather_model.dart';

class WeatherBox extends StatelessWidget {
  final OpenWeatherModel current;
  final WeatherState state;
  const WeatherBox({super.key, required this.current, required this.state});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            getWeatherIcon(),
            width: 100,
          ),
          const VerticalDivider(
            thickness: 2,
          ),
          Wrap(
            direction: Axis.vertical,
            children: [
              Text(
                current.weather.first.description,
                style: const AppFonts.regular(
                  20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${current.main.feelsLike} °c',
                style: const AppFonts.bold(
                  30,
                  color: AppColors.lightBlue,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String getWeatherIcon() {
    switch (state) {
      case WeatherState.clearSky:
        return 'assets/icons/clear_sky.png';

      case WeatherState.cloudy:
        return 'assets/icons/cloudy.png';

      case WeatherState.partlyCloudy:
        return 'assets/icons/partly_cloud.png';

      case WeatherState.rain:
        return 'assets/icons/rain.png';

      case WeatherState.thunderStorm:
        return 'assets/icons/thunderStorm.png';

      default:
        return 'assets/icons/clear_sky.png';
    }
  }
}
