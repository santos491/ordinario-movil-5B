import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:touryucatan/model/restaurant.dart';

class RestaurantsApi {
  static Future<List<Restaurante>> getRestaurant(String query) async {
    final url = Uri.parse(
        'http://sitioaplicacionmovil.somee.com/api/Restaurantes');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List restaurants = json.decode(response.body);

      return restaurants.map((json) => Restaurante.fromJson(json)).where((restaurant) {
        final titleLower = restaurant.restaurante.toLowerCase();
        final authorLower = restaurant.direccion.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}