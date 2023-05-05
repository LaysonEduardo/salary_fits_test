import 'package:dio/dio.dart';
import 'package:salary_fits_test/src/services/http/http_services.dart';

class DioServices implements HttpServices {
  final Dio _dio;

  DioServices(this._dio);

  @override
  Future<Response<dynamic>> get(String url) async {
    final Response response = await _dio.get(url);
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception();
  }

  @override
  Future<Response> post(String url) async {
    final Response response = await _dio.post(
      url,
    );
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception();
  }

  @override
  Future<Response> put(String url) async {
    final Response response = await _dio.put(url);
    if (response.statusCode == 200) {
      return response;
    }
    throw Exception();
  }
}
