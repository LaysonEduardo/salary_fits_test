import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

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
