class TimeServices {
  TimeServices._();
  static isDay() {
    final time = DateTime.now();
    return (time.hour > 06 && time.hour < 18);
  }

  static isNight() {
    final time = DateTime.now();
    return (time.hour < 06 && time.hour > 18);
  }
}
