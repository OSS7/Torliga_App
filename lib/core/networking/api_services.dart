import 'package:dio/dio.dart';

class ApiServices {
  static final _dio = Dio();
  static Future<Response> get(String url) async {
    print('get');
    print(url);
    _dio.options.headers = {
      'Authorization':
          'Bearer 14813|l5WcBvXKig4BrcU0op4LkW7ML7ekVb2vH96Wkm6l00d96ff8',
      'Content-Type': 'application/json',
    };
    final response = await _dio.get(url);
    return response;
  }

  static Future<Response> put(String url,
      {Map<String, dynamic>? params}) async {
    final response = await _dio.put(url);

    return response;
  }
}
