import 'package:dio/dio.dart';

class ApiServices {
  static final _dio = Dio();
  static Future<Response> get(String url) async {
    final response = await _dio.get(url);

    return response;
  }

  static Future<Response> put(String url,
      {Map<String, dynamic>? params}) async {
    final response = await _dio.put(url);

    return response;
  }
}
