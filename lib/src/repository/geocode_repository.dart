import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:salary_fits_test/src/repository/endpoints.dart';
import '../common/app_exception.dart';
import '../models/location/location.dart';
import '../services/http/base/http_services.dart';

class GeoCodeRepository {
  static final HttpServices _http = Modular.get<HttpServices>();
  GeoCodeRepository._();

  static Future<Location> fetchLocation(Position coords) async {
    final result = await _http.get(Endpoints.geoCoding(positon: coords));

    if (result.statusCode == 200) {
      final location = Location.fromJson(result.data[0]);
      location.latitude = coords.latitude;
      location.longitude = coords.longitude;

      return location;
    }
    throw HTTPException();
  }
}
