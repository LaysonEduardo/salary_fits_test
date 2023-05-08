import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';
import 'package:salary_fits_test/generated/l10n.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/common/app_fonts.dart';
import 'package:salary_fits_test/src/pages/commom_components/default_box.dart';
import 'package:salary_fits_test/src/pages/commom_components/header_container.dart';
import 'package:salary_fits_test/src/pages/commom_components/humidity_container.dart';
import 'package:salary_fits_test/src/pages/commom_components/weather_container.dart';
import 'package:salary_fits_test/src/pages/home/bloc/home_bloc.dart';
import 'package:salary_fits_test/src/pages/home/state/home_state.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../common/app_background.dart';
import 'events/home_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = Modular.get<HomeBloc>();
  final _pageController = PageController();
  @override
  void initState() {
    _bloc.add(FetchToday());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: _bloc,
        builder: (context, state) {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: state is HomeSuccessState
                  ? PreferredSize(
                      preferredSize: const Size.fromHeight(120),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: ShowUpAnimation(
                            child: TabBar(
                              indicatorColor: Colors.white,
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                Tab(
                                  height: 30,
                                  child: Text(
                                    I18n.of(context).today,
                                    style: const AppFonts.medium(
                                      16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Tab(
                                  height: 30,
                                  child: Text(
                                    I18n.of(context).nextDays,
                                    style: const AppFonts.medium(16,
                                        color: Colors.white),
                                  ),
                                ),
                                Tab(
                                  height: 30,
                                  child: Text(
                                    I18n.of(context).settings,
                                    style: const AppFonts.medium(16,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                  : null,
              body: AppBackground(
                state: state is HomeSuccessState ? state.weatherState : null,
                child: SafeArea(
                  child: TabBarView(
                    // controller: _pageController,
                    children: [
                      buildToday(state),
                      buildNextDays(),
                      buildToday(state),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget buildToday(state) {
    if (state is HomeFirstLoadingState) {
      return Center(
        child: ShowUpAnimation(
          offset: 0,
          child: const RiveAnimation.asset('assets/animations/loading.riv'),
        ),
      );
    } else if (state is HomeSuccessState) {
      return DefaultBox(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          // vertical: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: Column(
          children: [
            HeaderContainer(
              values: state,
              onUpdate: () {
                _bloc.add(
                  UpdateToday(),
                );
              },
            ),
            const SizedBox(height: 25),
            WeatherContainer(
              current: state.todayWeather,
              weatherState: state.weatherState,
            ),
            const SizedBox(height: 25),
            HumidityContainer(
              weatherModel: state.todayWeather,
              weatherState: state.weatherState,
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Text('fail'),
      );
    }
  }

  Widget buildNextDays() {
    return Container();
  }
}
