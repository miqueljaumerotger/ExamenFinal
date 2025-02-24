import 'dart:convert';

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

    factory Pokemons.fromJson(String str) => Pokemons.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pokemons.fromMap(Map<String, dynamic> json) => Pokemons(
        id: json["id"],
        nom: json["nom"],
        descripcio: json["descripcio"],
        tipus: json["tipus"],
        sexe: json["sexe"],
        foto: json["foto"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "descripcio": descripcio,
        "tipus": tipus,
        "sexe": sexe,
        "foto": foto,
    };
}
