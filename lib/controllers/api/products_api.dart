import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:ecommers/models/products_model.dart';

class ApiService {
  

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      log('status code is ${response.statusCode}');
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        print(data); // Check the raw response data
        return data.map((product) => ProductModel.fromJson(product)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print("API error: $e"); // Debug any errors here
      throw Exception('Failed to load products');
    }
  }

 
}
