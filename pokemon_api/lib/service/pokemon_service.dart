import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokemon.dart';

class PokemonService {
  final String baseUrl = "https://pokeapi.co/api/v2/pokemon?limit=151";

  Future<List<Pokemon>> fetchPokemons() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List results = data['results'];

      List<Pokemon> pokemons = [];
      for (int i = 0; i < results.length; i++) {
        final name = results[i]['name'];
        final url = results[i]['url'];

        // ID do Pokémon vem da URL da API
        final id = int.parse(url.split("/")[url.split("/").length - 2]);

        pokemons.add(
          Pokemon(
            id: id,
            name: name,
            imageUrl:
                "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png",
          ),
        );
      }

      return pokemons;
    } else {
      throw Exception("Erro ao carregar Pokémons");
    }
  }
}
