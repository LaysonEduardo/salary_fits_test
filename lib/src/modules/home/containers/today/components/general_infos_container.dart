import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/common/app_weather_icons.dart';
import 'package:salary_fits_test/src/models/weather/open_weather_model.dart';
import 'package:salary_fits_test/src/common/components/default_box.dart';
import '../../../../../common/app_fonts.dart';
import '../../../../../services/weather/weather_management.dart';

class GeneralInfosContainer extends StatelessWidget {
  final WeatherManagement weather = Modular.get<WeatherManagement>();

  GeneralInfosContainer({
    super.key,
  });

  OpenWeatherModel? get today => weather.todayWeather;

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
              color: AppColors.accent(weatherState: weather.state),
            ),
          ),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: DefaultBox(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              constraints: const BoxConstraints(maxWidth: 45),
                              child: AppWeatherIcons.humidity(),
                            ),
                            const VerticalDivider(
                              thickness: 2,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              I18n.of(context).humidity,
                              style: AppFonts.medium(
                                14,
                                color: AppColors.accent(
                                  weatherState: weather.state,
                                ),
                              ),
                            ),
                            Text(
                              '${today?.main.humidity} %',
                              style: AppFonts.regular(
                                14,
                                color: AppColors.accent(
                                  weatherState: weather.state,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: DefaultBox(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 15,
                  ),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppWeatherIcons.wind(size: 45),
                            const VerticalDivider(
                              thickness: 2,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              I18n.of(context).wind,
                              style: AppFonts.medium(
                                14,
                                color: AppColors.accent(
                                  weatherState: weather.state,
                                ),
                              ),
                            ),
                            Text(
                              '${today?.wind.speed} m/s',
                              style: AppFonts.regular(
                                14,
                                color: AppColors.accent(
                                  weatherState: weather.state,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
