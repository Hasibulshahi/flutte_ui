import 'package:flutte_ui/models/user_model.dart';
import '../services/signup_service.dart';

class SignupController {
  final SignupService _signupService = SignupService();

  Future<Map<String, dynamic>> signup(UserModel usermodel) async {
    return await _signupService.signup(usermodel);
  }
}
