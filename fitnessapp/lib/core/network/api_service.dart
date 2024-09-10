import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> get(String url, {Map<String, dynamic>? headers}) async {
    try {
      return await _dio.get(url, options: Options(headers: headers));
    } catch (e) {
      throw Exception('Error fetching data');
    }
  }
}
