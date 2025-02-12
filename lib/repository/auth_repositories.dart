import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class AuthRepository {
  final Dio _dio = Dio();

  Future<String?> login(String userName, String password) async {
    try {
      final response = await _dio.post(
        'https://simpletodoapp-9vpn.onrender.com/api/v1/Auth/sign-in',
        data: {'userName': userName, 'password': password},
      );

      if (response.statusCode == 200) {
        final token = response.data['token']; // Assuming token in response
        final userBox = Hive.box('userBox');
        userBox.put('token', token); // Store token locally
        return token;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<bool> register(String userName, String email, String password) async {
    try {
      final response = await _dio.post(
        'https://simpletodoapp-9vpn.onrender.com/api/v1/Auth/create-account',
        data: {
          "userName": userName,
          "userEmail": email,
          "password": password,
        },
      );

      return response.statusCode == 201;
    } catch (e) {
      return false;
    }
  }
}
