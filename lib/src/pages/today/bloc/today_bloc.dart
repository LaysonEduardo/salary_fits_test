import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/today_events.dart';
import '../state/today_state.dart';

class TodayBloc extends Bloc<TodayEvents, TodayState> {
  TodayBloc() : super(TodayLoadingState());
}
