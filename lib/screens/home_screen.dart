import 'package:examen_final_jaume/models/pokemon.dart';
import 'package:examen_final_jaume/services/pokemons_service.dart';
import 'package:flutter/material.dart';

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

/*
  // Refrescar la llista d'usuaris
  void _refreshUsers() {
    setState(() {
      _usersFuture = UserService.getUsers();
    });
  }

  // Esborrar un usuari i refrescar
  void _deleteUser(String id) async {
    await UserService.deleteUser(id);
    _refreshUsers();
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokemons"),
        /*
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              // Navega a la pantalla per crear un nou usuari
              await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewUserScreen()),
              );
              _refreshUsers();
            },
          ),
        ],
        */
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
                  subtitle: Text(pokemon.tipus),
                  /*
                  onTap: () {
                    // Navega a la pantalla de detall de l’usuari
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(user: user),
                      ),
                    );
                  },
                  
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      _deleteUser(user.id);
                    },
                  ),
                  */
                );
              },
            );
          }
        },
      ),
    );
  }
}
