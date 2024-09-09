import 'package:dio/dio.dart';

class FitbitService {
  final Dio _dio = Dio();

  Future<void> getFitbitData(String accessToken) async {
    final response = await _dio.get(
      'https://api.fitbit.com/1/user/-/profile.json',
      options: Options(
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      ),
    );
    print(response.data);
  }
}
