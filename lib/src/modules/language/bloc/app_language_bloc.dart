import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../events/app_language_state.dart';
import '../state/app_language_event.dart';

AppLanguageBloc get appLanguageBloc => Modular.get<AppLanguageBloc>();

class AppLanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  AppLanguageBloc() : super(LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) {
    emit(state.copyWith(event.selectedLanguage));
  }
}
