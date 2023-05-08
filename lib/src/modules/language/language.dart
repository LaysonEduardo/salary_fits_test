import 'dart:io';
import 'dart:ui';

enum Language {
  english(Locale('en'), 'en'),
  portuguese(Locale('pt'), 'pt');

  const Language(this.value, this.text);

  final Locale value;
  final String text;
}

Language deviceLanguage() {
  final value = Platform.localeName.split('_')[0];
  return Language.values.firstWhere((element) => element.text == value);
}
