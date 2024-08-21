abstract class AuthRepository {
  Future<String> loginUser(String email, String password);
  Future<String> registerUser(String email, String password);
}
