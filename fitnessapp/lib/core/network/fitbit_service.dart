import 'package:dio/dio.dart';
import 'package:fitnessapp/core/network/api.dart';

class FitbitService {
  final Dio _dio = Dio();

  Future<Response> getFitbitProfileData(String accessToken) async {
    final response = await _dio.get(
      ApiString.fitbitProfile,
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    return response;
  }
}
