import 'package:examen_final_jaume/models/pokemon.dart';
import 'package:examen_final_jaume/screens/new_pokemon_screen.dart';
import 'package:examen_final_jaume/screens/pokemon_detail_screen.dart';
import 'package:examen_final_jaume/services/pokemons_service.dart';
import 'package:flutter/material.dart';

/*
  *
  * StatefulWidget ja que necessitem actualitzar la llista de pokemons quan es crei un nou pokemon o s'elegeixi un per esborrar
  *
*/

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Pokemons>> _pokemonsFuture;

  @override
  void initState() {
    super.initState();
    _pokemonsFuture = PokemonsService.getPokemons();
  }

  // Refrescar la llista d'usuaris
  void _refreshPokemons() {
    setState(() {
      _pokemonsFuture = PokemonsService.getPokemons();
    });
  }

  // Esborrar un pokemon i refrescar
  void _deletePokemon(int id) async {
    await PokemonsService.deletePokemon(id);
    _refreshPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemons"),
        
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              // Navega a la pantalla per crear un nou usuari
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewUserScreen()),
              );
              _refreshPokemons();
            },
          ),
        ],
        
      ),
      body: FutureBuilder<List<Pokemons>>(
        future: _pokemonsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          else if (snapshot.hasError)
            return Center(child: Text("Error: ${snapshot.error}"));
          else if (!snapshot.hasData || snapshot.data!.isEmpty)
            return Center(child: Text("No hi ha pokemons."));
          else {
            final pokemons = snapshot.data!;
            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return ListTile(
                  title: Text(pokemon.nom),
                  
                  onTap: () {
                    // Navega a la pantalla de detall del pokemon
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokemonDetailScreen(pokemon: pokemon),
                      ),
                    );
                  },
                  
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deletePokemon(pokemon.id);
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
