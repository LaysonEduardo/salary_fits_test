import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:salary_fits_test/src/services/http/dio_services.dart';

void main() async {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);
  final services = DioServices(dio);
  const path = 'https://example.com';

  setUp(() {
    dio.httpClientAdapter = dioAdapter;
  });

  group('GET Methods test', () {
    dioAdapter.onGet(
      path,
      (request) => request.reply(200, {'message': 'Success!'}),
    );
    test('should return status code 200', () async {
      final Response response = await services.get(path);
      debugPrint(response.statusCode.toString());
      expect(response.statusCode, 200);
    });
  });
}
