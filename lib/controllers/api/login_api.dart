
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthRepository {
  Future<void> authenticate({
    required String username,
    required String password,
  }) async {
    Uri url = Uri.parse('https://fakestoreapi.com/auth/login'); // API endpoint

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'}, // Set JSON headers
        body: jsonEncode({ 
          'username': username, // Send username
          'password': password,  // Send password
        }),
      );

      if (response.statusCode == 200) {
        // ✅ Success: Handle response
        log('Authentication successful!');
        log('Response: ${response.body}'); // API response (usually contains token)
      } else {
        // ❌ Error: Handle different status codes
        log('Error: ${response.statusCode}, ${response.body}');
        throw Exception('Authentication failed: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e'); // Catch any network or request errors
      throw Exception('Network error occurred');
    }
  }
}
