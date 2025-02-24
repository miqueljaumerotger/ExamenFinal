import 'dart:convert';
import 'package:examen_final_jaume/models/pokemon.dart';
import 'package:http/http.dart' as http;

class PokemonsService {
  static const String baseUrl =
      'https://caf894e159f3c7860b13.free.beeceptor.com';

  // Obtenir tots els usuaris
  static Future<List<Pokemons>> getPokemons() async {
    final response = await http.get(Uri.parse('$baseUrl/api/pokemons/'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      List<Pokemons> pokemons = [];
      pokemons = data.map((e) => Pokemons.fromJson(e)).toList();
      return pokemons;
    } else {
      throw Exception('Error carregant els pokemons');
    }
  }

  // Crear un nou usuari
  static Future<Pokemons> createPokemon(Pokemons pokemon) async {
    final response = await http.post(
      Uri.parse('$baseUrl/api/pokemons.json'),
      body: json.encode(pokemon.toJson()),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Retorna per exemple: { "nom": "pikachu"}
      final data = json.decode(response.body);
      //String newId = data['name'];
      return Pokemons(
        id: pokemon.id,
        nom: pokemon.nom,
        descripcio: pokemon.descripcio,
        tipus: pokemon.tipus,
        sexe: pokemon.sexe,
        foto: pokemon.foto,
      );
    } else {
      throw Exception('Error creant el pokemon');
    }
  }

  // Esborrar un pokemon
  static Future<void> deletePokemon(int id) async {
    final response = await http.delete(
      Uri.parse(baseUrl + '/api/pokemons/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception('Error esborrant el pokemon');
    }
  }
}
