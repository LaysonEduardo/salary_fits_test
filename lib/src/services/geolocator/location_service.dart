import 'package:geolocator/geolocator.dart';
import 'package:salary_fits_test/src/common/app_exception.dart';
import 'package:salary_fits_test/src/repository/geocode_repository.dart';

import '../../models/location/location.dart';

class LocationService {
  LocationService._();

  static Future<Position?> _getCoords() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw LocationException();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      throw LocationException();
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        throw LocationException();
      }
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
  }

  static Future<Location> getCurrentLocation() async {
    final coords = await _getCoords();
    if (coords != null) {
      final location = await GeoCodeRepository.fetchLocation(coords);
      return location;
    }

    throw LocationException();
  }
}
