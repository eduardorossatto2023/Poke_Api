import '../../domain/model/pokemon.dart';

class SearchPokemonsUseCase {
  List<Pokemon> call(
      {required String query, required List<Pokemon> allPokemons}) {
    if (query.isEmpty) return allPokemons;

    return allPokemons
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
