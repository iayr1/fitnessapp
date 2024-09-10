import 'package:dio/dio.dart';
import 'package:fitnessapp/core/network/api.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NutritionRepository {
  final Dio _dio = Dio();
  
  // Load the environment variables
  String nutritionixAppId = dotenv.env['NUTRITIONIX_APP_ID'] ?? '';
  String nutritionixApiKey = dotenv.env['NUTRITIONIX_API_KEY'] ?? '';

  Future<Response> getNutritionData(String query) async {
    final response = await _dio.get(
      ApiString.nutritionixSearch,
      queryParameters: {
        'query': query,
      },
      options: Options(
        headers: {
          'x-app-id': nutritionixAppId,
          'x-app-key': nutritionixApiKey,
        },
      ),
    );
    return response;
  }
}
