import 'dart:convert';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

class MenuService {
  Future<List<Map<String, dynamic>>> fetchMenu() async {
    const String url =
        "https://localhost:7216/api/menu"; // Replace with your actual API URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body); // Decode JSON

      // Print the raw JSON for debugging (optional)
      print("API Response: $jsonResponse");

      // Ensure the structure is as expected
      if (jsonResponse is Map<String, dynamic> &&
          jsonResponse.containsKey('result') &&
          jsonResponse['result'] is List) {
        // Extract the required fields from each object in the 'result' list
        return List<Map<String, dynamic>>.from(
            jsonResponse['result'].map((item) {
          return {
            'id': item['menuID'] ?? 'Unknown ID', // Handle null ID
            'menuName':
                item['manuName'] ?? 'Unnamed Menu', // Handle null menuName
            'category':
                item['category'] ?? 'Uncategorized', // Handle null category
            'price': item['price'] ?? 0.0, // Handle null price
          };
        }));
      } else {
        throw Exception(
            "Invalid response format: 'result' key missing or not a list");
      }
    } else {
      throw Exception(
          "Failed to load menu items (Status code: ${response.statusCode})");
    }
  }
}

