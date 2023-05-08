import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';
import '../../common/app_colors.dart';
import '../../common/app_fonts.dart';
import '../../models/weather/open_weather_model.dart';

class WeatherContainer extends StatelessWidget {
  final OpenWeatherModel current;
  final WeatherState weatherState;
  const WeatherContainer({
    super.key,
    required this.current,
    required this.weatherState,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            getWeatherIcon(),
            width: 150,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // alignment: WrapAlignment.center,
            // direction: Axis.vertical,
            children: [
              Text(
                current.weather.first.description,
                style: const AppFonts.regular(
                  20,
                  color: Colors.grey,
                ),
              ),
              Text(
                '${current.main.feelsLike.round()} °C',
                style: AppFonts.medium(
                  40,
                  color: AppColors.accent(weatherState: weatherState),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  String getWeatherIcon() {
    switch (weatherState) {
      case WeatherState.clearSky:
        return 'assets/icons/clear_sky.png';

      case WeatherState.cloudy:
        return 'assets/icons/cloudy.png';

      case WeatherState.rain:
        return 'assets/icons/rain.png';

      case WeatherState.thunderStorm:
        return 'assets/icons/thunderStorm.png';

      default:
        return 'assets/icons/clear_sky.png';
    }
  }
}
