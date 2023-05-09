import 'package:flutter/material.dart';

import '../../../../common/components/default_box.dart';
import '../../../../common/components/keep_alive_container.dart';
import '../../components/dynamic_bottom.dart';
import 'components/general_infos_container.dart';
import 'components/weather_container.dart';

class TodayContainer extends StatelessWidget {
  const TodayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return KeepAliveContainer(
      child: DefaultBox(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 25),
                  WeatherContainer(),
                  const SizedBox(height: 25),
                  GeneralInfosContainer(),
                ],
              ),
            ),
            DynamicBottom(),
          ],
        ),
      ),
    );
  }
}
