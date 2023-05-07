class Location {
  double latitude;
  double longitude;
  final String country;
  final String state;

  Location({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.state,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: json['lat'],
      longitude: json['lon'],
      country: json['country'],
      state: json['state'],
    );
  }
}
