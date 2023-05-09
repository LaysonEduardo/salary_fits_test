import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/common/app_fonts.dart';
import 'package:salary_fits_test/src/common/app_weather_icons.dart';
import 'package:salary_fits_test/src/common/components/default_box.dart';
import 'package:salary_fits_test/src/modules/home/bloc/home_bloc.dart';

import '../../../../common/components/keep_alive_container.dart';

class NextDaysContainer extends StatelessWidget {
  const NextDaysContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepAliveContainer(
      child: DefaultBox(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: ListView.builder(
          itemCount: homeBloc.weather.nextDaysWeather.length,
          itemBuilder: (context, index) {
            final day = homeBloc.weather.nextDaysWeather[index];
            return SizedBox(
              height: 80,
              child: DefaultBox(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        Text(
                          setDate(day.dt),
                          style: AppFonts.medium(
                            16,
                            color: AppColors.accent(
                              weatherState: homeBloc.weather.state,
                            ),
                          ),
                        ),
                        Text(
                          day.weather.first.description,
                          style: AppFonts.regular(
                            16,
                            color: AppColors.accent(
                              weatherState: homeBloc.weather.state,
                            ),
                          ),
                        ),
                      ],
                    ),
                    AppWeatherIcons.weatherIcon(
                      weatherState: homeBloc.weather.setWeatherState(
                        day.weather.first.main,
                      ),
                      size: 45,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  String setDate(value) {
    return DateFormat.MMMMEEEEd().format(
      DateTime.fromMillisecondsSinceEpoch(
        value * 1000,
      ),
    );
  }
}
