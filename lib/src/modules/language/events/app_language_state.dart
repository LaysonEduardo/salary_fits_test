import '../language.dart';

class LanguageState {
  LanguageState({this.selectedLanguage});

  Language? selectedLanguage;

  LanguageState copyWith(Language selectedLanguage) {
    return LanguageState(
      selectedLanguage: selectedLanguage,
    );
  }
}
