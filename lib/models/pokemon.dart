/*
    {
        "id": 1,
        "nom": "Charmander",
        "descripcio": "sadasdasdad",
        "tipus": "foc",
        "sexe": "masculi",
        "foto": "https://static.wikia.nocookie.net/sonicpokemon/images/e/e0/Charmander_AG_anime.png/revision/latest?cb=20130714191911"
    }
*/

class Pokemons {
  int id;
  String nom;
  String descripcio;
  String tipus;
  String sexe;
  String foto;

  Pokemons({
    required this.id,
    required this.nom,
    required this.descripcio,
    required this.tipus,
    required this.sexe,
    required this.foto,
  });

  // Crea un Pokémon a partir del JSON rebut.
  factory Pokemons.fromJson(Map<String, dynamic> json) {
    return Pokemons(
      id: json['id'] ?? 0, // Un 0 si ve sense id
      nom: json['nom'] ?? '',
      descripcio: json['descripcio'] ?? '',
      tipus: json['tipus'] ?? '',
      sexe: json['sexe'] ?? '',
      foto: json['foto'] ?? '',
    );
  }

  // Convertir un Pokémon a JSON.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nom': nom,
      'descripcio': descripcio,
      'tipus': tipus,
      'sexe': sexe,
      'foto': foto,
    };
  }
}
