import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/services/weather/weather_state.dart';

class AppBackground extends StatelessWidget {
  final WeatherState? state;
  final Widget child;
  const AppBackground({super.key, required this.child, this.state});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.accent(weatherState: state ?? WeatherState.unknown),
            AppColors.lighten(state ?? WeatherState.unknown),
            AppColors.accent(
              weatherState: state ?? WeatherState.unknown,
              darker: true,
            )
          ],
        ),
      ),
      child: child,
    );
  }
}
