import 'package:demo_poc_bloc/features/user_list/data/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers(int page);
}