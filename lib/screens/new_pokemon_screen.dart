import 'package:examen_final_jaume/models/pokemon.dart';
import 'package:examen_final_jaume/services/pokemons_service.dart';
import 'package:flutter/material.dart';

class NewUserScreen extends StatefulWidget {
  @override
  _NewUserScreenState createState() => _NewUserScreenState();
}

class _NewUserScreenState extends State<NewUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _nomController = TextEditingController();
  final _descripcioController = TextEditingController();
  final _tipusController = TextEditingController();
  final _sexeController = TextEditingController();
  final _fotoController = TextEditingController();

  bool _isLoading = false;

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Pokemons newPokemon = Pokemons(
        id: int.parse(_idController.text),
        nom: _nomController.text,
        descripcio: _descripcioController.text,
        tipus: _tipusController.text,
        sexe: _sexeController.text,
        foto: _fotoController.text,
      );
      try {
        await PokemonsService.createPokemon(newPokemon);
        Navigator.pop(context); // Torna al HomeScreen
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error creant el pokemon: $e")),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _nomController.dispose();
    _descripcioController.dispose();
    _tipusController.dispose();
    _sexeController.dispose();
    _fotoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nou Pokemon"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading 
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: ListView(
                children: [
                  TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(labelText: "Id"),
                    validator: (value) => value!.isEmpty ? "Introdueix l'id" : null,
                  ),
                  TextFormField(
                    controller: _nomController,
                    decoration: InputDecoration(labelText: "Nom"),
                    validator: (value) => value!.isEmpty ? "Introdueix el nom" : null,
                  ),
                  TextFormField(
                    controller: _descripcioController,
                    decoration: InputDecoration(labelText: "Descripcio"),
                    validator: (value) => value!.isEmpty ? "Introdueix la descripcio" : null,
                  ),
                  TextFormField(
                    controller: _tipusController,
                    decoration: InputDecoration(labelText: "Tipus"),
                    validator: (value) => value!.isEmpty ? "Introdueix el tipus" : null,
                  ),
                  TextFormField(
                    controller: _sexeController,
                    decoration: InputDecoration(labelText: "Sexe"),
                    validator: (value) => value!.isEmpty ? "Introdueix el sexe" : null,
                  ),
                  TextFormField(
                    controller: _fotoController,
                    decoration: InputDecoration(labelText: "URL de la imatge"),
                    validator: (value) => value!.isEmpty ? "Introdueix l'URL de la imatge" : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text("Crear Pokemon"),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
