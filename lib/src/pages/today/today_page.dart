import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/pages/commom_components/default_box.dart';
import 'package:salary_fits_test/src/pages/commom_components/weather_box.dart';
import 'package:salary_fits_test/src/pages/today/bloc/today_bloc.dart';
import 'package:salary_fits_test/src/pages/today/state/today_state.dart';
import '../../common/app_fonts.dart';
import '../../common/app_background.dart';
import 'events/today_events.dart';

class TodayPage extends StatefulWidget {
  const TodayPage({super.key});

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  final _bloc = Modular.get<TodayBloc>();

  @override
  void initState() {
    _bloc.add(FetchToday());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayBloc, TodayState>(
        bloc: _bloc,
        builder: (context, state) {
          return Scaffold(
            body: AppBackground(
              child: SafeArea(
                child: buildBody(state),
              ),
            ),
            extendBody: true,
            bottomNavigationBar: _bloc.state is TodaySuccessState
                ? SafeArea(
                    child: DefaultBox(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: BottomNavigationBar(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        enableFeedback: true,
                        selectedItemColor: AppColors.lightBlue,
                        items: [
                          BottomNavigationBarItem(
                            icon: const Icon(Icons.today),
                            label: I18n.of(context).today,
                          ),
                          BottomNavigationBarItem(
                            icon: const Icon(Icons.calendar_month),
                            label: I18n.of(context).nextDays,
                          ),
                          BottomNavigationBarItem(
                            icon: const Icon(Icons.settings_rounded),
                            label: I18n.of(context).settings,
                          ),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          );
        });
  }

  Widget buildBody(state) {
    if (state is TodayFirstLoadingState) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is TodaySuccessState) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DefaultBox(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.start,
                      direction: Axis.vertical,
                      children: [
                        Text(
                          '${state.location.state}, ${state.location.country}',
                          style: const AppFonts.medium(
                            20,
                            color: AppColors.lightBlue,
                          ),
                        ),
                        Text(
                          state.date,
                          style: const AppFonts.regular(
                            16,
                            color: AppColors.lightBlue,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () async {
                        _bloc.add(UpdateToday());
                      },
                      child: const Icon(
                        Icons.refresh_rounded,
                        size: 28,
                        color: AppColors.lightBlue,
                      ),
                    )
                  ],
                ),
                const Divider(thickness: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Last update: ${state.lastUpdate}',
                      style: const AppFonts.regular(
                        14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          DefaultBox(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: [
                WeatherBox(current: state.todayWeather, state: state.state),
                const SizedBox(height: 65),
                WeatherBox(current: state.todayWeather, state: state.state),
                const SizedBox(height: 65),
                WeatherBox(current: state.todayWeather, state: state.state),
              ],
            ),
          ),
          const SizedBox.shrink(),
        ],
      );
    } else {
      return Container(
        child: Text('fail'),
      );
    }
  }
}
