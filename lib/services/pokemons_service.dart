import 'dart:convert';
import 'package:examen_final_jaume/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonsService {
  static const String baseUrl = 'https://caf894e159f3c7860b13.free.beeceptor.com';

  // Obtenir tots els usuaris
  static Future<List<Pokemons>> getPokemons() async {
    final response = await http.get(Uri.parse('$baseUrl/api/pokemons/'));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      List<Pokemons> pokemons = [];
      // Cada entrada té una clau (id) i els seus valors
      /*data.forEach((key, value) {
        pokemons.add(Pokemons.fromJson(key, value));
      });*/
      pokemons.add(Pokemons.fromJson(data));
      return pokemons;
    } else {
      throw Exception('Error carregant els pokemons');
    }
  }
}