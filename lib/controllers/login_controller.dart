import '../services/login_service.dart';

class LoginController {
  final LoginService _loginService = LoginService();

  Future<Map<String, dynamic>> login(String username, String password) async {
    return await _loginService.login(username, password);
  }
}