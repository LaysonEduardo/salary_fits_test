import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:salary_fits_test/src/common/app_exception.dart';
import 'package:salary_fits_test/src/repository/endpoints.dart';
import 'package:salary_fits_test/src/services/http/base/http_services.dart';

import '../../models/location/location.dart';

class LocationService {
  static final HttpServices _http = Modular.get<HttpServices>();
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
      final result = await _http.get(Endpoints().geoCoding(positon: coords));

      if (result.statusCode == 200) {
        return Location.fromJson(result.data[0]);
      }
    }

    throw Exception();
  }
}
