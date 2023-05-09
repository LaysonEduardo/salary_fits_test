import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:salary_fits_test/src/common/custom_appbar.dart';
import 'package:salary_fits_test/src/modules/home/bloc/home_bloc.dart';
import 'package:salary_fits_test/src/modules/home/containers/today/today_container.dart';
import 'package:salary_fits_test/src/modules/home/state/home_state.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../common/app_background.dart';
import 'containers/next_days/next_days_container.dart';
import 'events/home_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(FetchToday());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
        bloc: homeBloc,
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              extendBodyBehindAppBar: true,
              appBar: state is HomeSuccessState
                  ? CustomAppBar(
                      values: state,
                      onUpdate: () {
                        homeBloc.add(
                          UpdateToday(),
                        );
                      },
                    )
                  : null,
              body: AppBackground(
                state: state is HomeSuccessState ? state.weatherState : null,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _buildHome(state),
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildHome(state) {
    if (state is HomeFirstLoadingState) {
      return Center(
        child: ShowUpAnimation(
          offset: 0,
          child: const RiveAnimation.asset('assets/animations/loading.riv'),
        ),
      );
    } else if (state is HomeSuccessState) {
      return const TabBarView(
        children: [
          TodayContainer(),
          NextDaysContainer(),
        ],
      );
    } else {
      return Container(
        child: Text('fail'),
      );
    }
  }
}
