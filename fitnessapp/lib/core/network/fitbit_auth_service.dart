import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'dart:convert';

class FitbitAuthService {
  final String clientId = dotenv.env['FITBIT_CLIENT_ID'] ?? '';
  final String clientSecret = dotenv.env['FITBIT_CLIENT_SECRET'] ?? '';
  final String redirectUri = dotenv.env['FITBIT_REDIRECT_URI'] ?? '';

  final String scopes = 'activity heartrate location nutrition profile sleep';

  Future<String?> authenticate() async {
    final authorizationUrl =
        'https://www.fitbit.com/oauth2/authorize?response_type=code'
        '&client_id=$clientId'
        '&redirect_uri=$redirectUri'
        '&scope=$scopes';

    final result = await FlutterWebAuth.authenticate(
      url: authorizationUrl,
      callbackUrlScheme: 'https',
    );

    final code = Uri.parse(result).queryParameters['code'];

    if (code != null) {
      return await _getAccessToken(code);
    } else {
      return null;
    }
  }

  Future<String?> _getAccessToken(String code) async {
    const tokenUrl = 'https://api.fitbit.com/oauth2/token';

    final basicAuth =
        'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}';

    final response = await Dio().post(
      tokenUrl,
      data: {
        'client_id': clientId,
        'grant_type': 'authorization_code',
        'redirect_uri': redirectUri,
        'code': code,
      },
      options: Options(
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        contentType: Headers.formUrlEncodedContentType,
      ),
    );

    if (response.statusCode == 200) {
      final accessToken = response.data['access_token'];
      final refreshToken = response.data['refresh_token'];
      // Store tokens securely
      return accessToken;
    } else {
      print('Failed to get access token: ${response.statusMessage}');
      return null;
    }
  }
}
