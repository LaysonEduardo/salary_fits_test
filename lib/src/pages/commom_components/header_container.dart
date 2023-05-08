import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/pages/home/state/home_state.dart';
import '../../common/app_colors.dart';
import '../../common/app_fonts.dart';

class HeaderContainer extends StatelessWidget {
  final HomeSuccessState values;
  final VoidCallback? onUpdate;
  const HeaderContainer({
    super.key,
    required this.values,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
              direction: Axis.vertical,
              children: [
                Text(
                  '${values.location.state}, ${values.location.country}',
                  style: AppFonts.medium(
                    20,
                    color: AppColors.accent(weatherState: values.weatherState),
                  ),
                ),
                Text(
                  values.date,
                  style: AppFonts.regular(
                    16,
                    color: AppColors.accent(weatherState: values.weatherState),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: onUpdate,
              child: Icon(
                Icons.refresh_rounded,
                size: 28,
                color: AppColors.accent(weatherState: values.weatherState),
              ),
            ),
          ],
        ),
        const Divider(thickness: 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Last update: ${values.lastUpdate}',
              style: const AppFonts.regular(
                14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
