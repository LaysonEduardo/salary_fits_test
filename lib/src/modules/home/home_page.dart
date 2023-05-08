import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:rive/rive.dart';
import 'package:salary_fits_test/src/common/custom_appbar.dart';
import 'package:salary_fits_test/src/modules/commom_components/default_box.dart';
import 'package:salary_fits_test/src/modules/home/components/dynamic_bottom.dart';
import 'package:salary_fits_test/src/modules/home/components/humidity_container.dart';
import 'package:salary_fits_test/src/modules/commom_components/keep_alive_container.dart';
import 'package:salary_fits_test/src/modules/home/components/weather_container.dart';
import 'package:salary_fits_test/src/modules/home/bloc/home_bloc.dart';
import 'package:salary_fits_test/src/modules/home/state/home_state.dart';
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
            length: 2,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: state is HomeSuccessState
                  ? CustomAppBar(
                      values: state,
                      onUpdate: () {
                        _bloc.add(
                          UpdateToday(),
                        );
                      },
                    )
                  : null,
              body: AppBackground(
                state: state is HomeSuccessState ? state.weatherState : null,
                child: SafeArea(
                  child: TabBarView(
                    // controller: _pageController,
                    children: [
                      buildToday(state),
                      buildNextDays(),
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
