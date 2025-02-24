// lib/user_detail_screen.dart
import 'package:examen_final_jaume/models/pokemon.dart';
import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemons pokemon;

  const PokemonDetailScreen({required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.nom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Visualitza la imatge
              Image.network(
                pokemon.foto,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16),
              Text("Id: ${pokemon.id}", style: TextStyle(fontSize: 18)),
              Text("Nom: ${pokemon.nom}", style: TextStyle(fontSize: 18)),
              Text("Descripcio: ${pokemon.descripcio}", style: TextStyle(fontSize: 18)),
              Text("Tipus: ${pokemon.tipus}", style: TextStyle(fontSize: 18)),
              Text("Sexe: ${pokemon.sexe}", style: TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
