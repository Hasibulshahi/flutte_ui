import 'dart:convert';
import 'package:flutte_ui/models/user_model.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class SignupService {
  final String _baseUrl =
      'https://localhost:7001/api'; // Replace with API base URL

  Future<Map<String, dynamic>> signup(UserModel usermodel) async {

    final url = Uri.parse('$_baseUrl/employee/save'); // Ensure this matches API route

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'firstName': usermodel.firstName, // Match the DTO field names
          'lastName': usermodel.lastName,
          'email': usermodel.email, 
          'phone': usermodel.phone,
          'password': usermodel.password
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        if (responseData['isSuccess'] == true) {
          return {
            'success': true,
            'data': responseData['result'],
          }; // Return the employee details on success
        } else {
          return {
            'success': false,
            'message': responseData['result'],
          }; // Return the error message on failure
        }
      } else {
        return {
          'success': false,
          'message': 'Server error: ${response.statusCode}',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Error: $e',
      };
    }
  }
}
