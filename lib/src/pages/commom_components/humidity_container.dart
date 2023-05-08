import 'package:flutter/material.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/pages/commom_components/default_box.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';
import '../../common/app_fonts.dart';
import '../../models/weather/open_weather_model.dart';

class HumidityContainer extends StatelessWidget {
  final OpenWeatherModel weatherModel;
  final WeatherState weatherState;
  const HumidityContainer({
    super.key,
    required this.weatherModel,
    required this.weatherState,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            I18n.of(context).infos,
            style: AppFonts.medium(
              20,
              color: AppColors.accent(weatherState: weatherState),
            ),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                // direction: Axis.vertical,
                children: [
                  Flexible(child: DefaultBox(child: Text('test'))),
                  SizedBox(width: 10),
                  Flexible(child: DefaultBox(child: Text('test'))),
                ],
              ),
            ],
          )
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

      case WeatherState.snow:
        return 'assets/icons/thunderStorm.png';

      default:
        return 'assets/icons/clear_sky.png';
    }
  }
}
