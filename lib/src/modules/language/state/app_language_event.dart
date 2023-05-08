import '../language.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class ChangeLanguage extends LanguageEvent {
  const ChangeLanguage({required this.selectedLanguage});
  final Language selectedLanguage;
}
