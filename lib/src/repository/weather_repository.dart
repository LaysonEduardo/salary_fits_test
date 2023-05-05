class WeatherRepository {
  final String baseURL = 'https://api.openweathermap.org';
  final String appID = 'dbcadc34a5cf5d53decf099c7ad40195';

  String weatherToday({required String lat, required String lon}) {
    return '/data/2.5/weather?lat=$lat&lon=$lon${appIdentity()}';
  }

  String nextDays({required String lat, required String lon}) {
    return '/data/2.5/forecast?lat=$lat&lon=$lon${appIdentity()}';
  }

  String geoCoding({required String city}) {
    return '/geo/1.0/direct?q=$city${appIdentity()}';
  }

  String appIdentity() {
    return '&appid={$appID}';
  }
}
