import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/pages/commom_components/default_box.dart';
import '../../common/app_fonts.dart';
import '../../services/weather/weather_management.dart';

class HumidityContainer extends StatelessWidget {
  final WeatherManagement management = Modular.get<WeatherManagement>();

  HumidityContainer({
    super.key,
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
              color: AppColors.accent(weatherState: management.state),
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
                children: const [
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
}
