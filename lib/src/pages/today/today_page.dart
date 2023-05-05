import 'package:flutter/material.dart';
import 'package:salary_fits_test/src/services/geolocator/location_service.dart';
import '../../common/app_fonts.dart';
import '../../common/dynamic_background.dart';

class TodayPage extends StatelessWidget {
  const TodayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DynamicBackground(
        child: SafeArea(
          child: Center(
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      children: const [
                        Text(
                          'Rio de Janeiro, Brasil',
                          style: AppFonts.medium(22, color: Colors.white),
                        ),
                        Text(
                          'Mon, jun 30',
                          style: AppFonts.regular(18, color: Colors.white),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        final value =
                            await LocationService.getCurrentLocation();
                        print(value);
                      },
                      child: const Icon(
                        Icons.settings,
                        size: 28,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
