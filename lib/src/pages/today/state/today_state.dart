abstract class TodayState {
  TodayState();
}

class TodayLoadingState extends TodayState {
  TodayLoadingState() : super();
}

class TodaySuccessState extends TodayState {
  TodaySuccessState() : super();
}

class TodayFailState extends TodayState {
  TodayFailState() : super();
}
