import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:touryucatan/model/craftsmen.dart';

class ArtesanosApi {
  static Future<List<Artesano>> getArtesanos(String query) async {
    final url = Uri.parse(
        'http://sitioaplicacionmovil.somee.com/api/Artesanias');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List artesanos = json.decode(response.body);

      return artesanos.map((json) => Artesano.fromJson(json)).where((artesano) {
        final titleLower = artesano.negocio.toLowerCase();
        final authorLower = artesano.direccion.toLowerCase();
        final searchLower = query.toLowerCase();

        return titleLower.contains(searchLower) ||
            authorLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}
