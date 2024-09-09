import 'package:dio/dio.dart';

class NutritionRepository {
  final Dio _dio = Dio();

  Future<void> getNutritionData(String foodItem) async {
    final response = await _dio.get(
      'https://trackapi.nutritionix.com/v2/natural/nutrients',
      queryParameters: {'query': foodItem},
      options: Options(
        headers: {
          'x-app-id': 'YOUR_APP_ID',
          'x-app-key': 'YOUR_APP_KEY',
        },
      ),
    );
    print(response.data);
  }
}
