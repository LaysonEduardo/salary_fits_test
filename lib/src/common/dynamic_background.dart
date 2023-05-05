import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import '../services/weather/weather_state.dart';

class DynamicBackground extends StatelessWidget {
  const DynamicBackground({super.key, required this.child});
  final Widget child;
  // final WeatherState weatherState = Modular.get<WeatherState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.lightBlue,
            AppColors.mediumBlue,
          ],
        ),
      ),
      child: child,
    );
  }
}
