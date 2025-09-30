import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pokemon_repository.dart';
import '../../core/domain/model/pokemon.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  @override
  Future<List<Pokemon>> getPokemons({int limit = 50, int offset = 0}) async {
    final response = await http.get(
      Uri.parse(
          'https://pokeapi.co/api/v2/pokemon?limit=$limit&offset=$offset'),
    );

    final data = json.decode(response.body);
    final List results = data['results'];

    return results.asMap().entries.map((entry) {
      final index = entry.key + 1 + offset;
      final name = entry.value['name'];
      return Pokemon(
        id: index,
        name: name[0].toUpperCase() + name.substring(1),
        imageUrl:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$index.png",
      );
    }).toList();
  }
}
