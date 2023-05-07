import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:salary_fits_test/src/repository/endpoints.dart';
import 'base/http_services.dart';

class DioServices implements HttpServices {
  final Dio _dio;
  final Endpoints endpoints = Endpoints();
  DioServices(this._dio);

  @override
  Future init() async {
    _dio.options = BaseOptions(baseUrl: endpoints.baseURL);
    debugPrint("DioServices started!");
  }

  @override
  Future<Response<dynamic>> get(String url) async {
    final Response response = await _dio.get(url).then((value) {
      return value;
    });
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
