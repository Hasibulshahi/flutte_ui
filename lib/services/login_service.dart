import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class LoginService {
  final String _baseUrl = 'https://localhost:7001/api'; // Replace with API base URL

  Future<Map<String, dynamic>> login(String username, String password) async {

    final url = Uri.parse('$_baseUrl/employee/login'); // Ensure this matches API route

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'Username': username, // Match the DTO field names
          'Password': password,
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