import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:salary_fits_test/src/common/app_colors.dart';
import 'package:salary_fits_test/src/common/app_exception.dart';
import 'package:salary_fits_test/src/common/app_fonts.dart';
import 'package:salary_fits_test/src/common/components/default_box.dart';
import 'package:salary_fits_test/src/common/custom_appbar.dart';
import 'package:salary_fits_test/src/modules/home/bloc/home_bloc.dart';
import 'package:salary_fits_test/src/modules/home/state/home_state.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../generated/l10n.dart';
import '../../common/app_background.dart';
import 'containers/next_days/next_days_container.dart';
import 'containers/today/today_container.dart';
import 'events/home_events.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    homeBloc.add(Fetch());
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
                        homeBloc.add(Fetch());
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
    if (state is HomeLoadingState) {
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
    } else if (state is HomeFailState) {
      return Center(
        child: DefaultBox(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                I18n.of(context).somenthingWrong,
                style: AppFonts.medium(
                  18,
                  color: AppColors.accent(
                    weatherState: homeBloc.weather.state,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                setExceptionMessage(state.exception),
                style: AppFonts.regular(
                  18,
                  color: AppColors.accent(
                    weatherState: homeBloc.weather.state,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              if (state.exception is LocationException) ...[
                MaterialButton(
                  onPressed: () {
                    homeBloc.add(Fetch());
                  },
                  color: AppColors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    I18n.of(context).save,
                    style: const AppFonts.medium(14, color: Colors.white),
                  ),
                ),
              ],
            ],
          ),
        ),
      );
    }
    return Container();
  }

  String setExceptionMessage(AppException exception) {
    if (exception is HTTPException) {
      return I18n.of(context).httpExceptionMessage;
    } else if (exception is LocationException) {
      return I18n.of(context).locationExceptionMessage;
    }
    return I18n.of(context).UnknownExceptionMessage;
  }
}
