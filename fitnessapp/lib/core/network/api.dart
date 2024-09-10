class ApiString {
  // Base URLs
  static const String fitbitBaseUrl = 'https://api.fitbit.com';
  static const String nutritionixBaseUrl = 'https://trackapi.nutritionix.com/v2';

  // Fitbit API Endpoints
  static const String fitbitProfile = '$fitbitBaseUrl/1/user/-/profile.json';

  // Nutritionix API Endpoints
  static const String nutritionixSearch = '$nutritionixBaseUrl/search/instant';
  static const String nutritionixNutrients = '$nutritionixBaseUrl/natural/nutrients';
}
