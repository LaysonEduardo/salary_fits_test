import 'package:dio/dio.dart';
import 'package:salary_fits_test/src/services/http/http_services.dart';

class DioServices implements HttpServices {
  final Dio _dio = Dio();

  @override
  Future<Response> get() async {
    throw UnimplementedError();
  }

  @override
  Future<Response> post() async {
    throw UnimplementedError();
  }

  @override
  Future<Response> put() async {
    throw UnimplementedError();
  }
}
