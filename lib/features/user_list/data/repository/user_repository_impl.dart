import 'package:demo_poc_bloc/features/user_list/data/models/user_model.dart';
import 'package:demo_poc_bloc/features/user_list/data/repository/user_repository.dart';
import 'package:dio/dio.dart';

class UserRepositoryImpl implements UserRepository {
  final Dio _dio;
  final String _getUsersUrl = 'https://reqres.in/api/users';

  UserRepositoryImpl(this._dio);

  @override
  Future<List<UserModel>> getUsers(int page) async {
    try {
      final response = await _dio.get(_getUsersUrl, queryParameters: {'page': page});
      if (response.statusCode == 200) {
        List<UserModel> users = (response.data['data'] as List)
            .map((userJson) => UserModel.fromJson(userJson))
            .toList();
        return users;
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      print('Error fetching users: $e');
      throw Exception('Failed to load users');
    }
  }
}



