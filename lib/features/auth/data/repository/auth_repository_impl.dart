import 'package:demo_poc_bloc/features/auth/data/repository/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final String _loginUrl = 'https://reqres.in/api/login';
  final String _registerUrl = 'https://reqres.in/api/register';


  AuthRepositoryImpl(this._dio);

  @override
  Future<String> loginUser(String email, String password) async {
    final response = await _dio.post(
      _loginUrl,
      data: {
        'email': email,
        'password': password,
      },
    );
    return response.data['token'];
  }

  @override
  Future<String> registerUser(String email, String password) async {
    final response = await _dio.post(
      _registerUrl,
      data: {
        'email': email,
        'password': password,
      },
    );
    return response.data['token'];
  }
}
