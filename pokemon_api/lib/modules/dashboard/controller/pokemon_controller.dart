import '../core/domain/model/pokemon.dart';
import '../core/domain/usecase/get_pokemons_usecase.dart';
import '../core/domain/usecase/search_pokemon_usecase.dart';

class PokemonController {
  final GetPokemonsUseCase getPokemonsUseCase;
  final SearchPokemonsUseCase searchPokemonsUseCase;

  List<Pokemon> allPokemons = [];
  List<Pokemon> filteredPokemons = [];

  PokemonController(this.getPokemonsUseCase, this.searchPokemonsUseCase);

  Future<void> loadPokemons() async {
    allPokemons = await getPokemonsUseCase();
    filteredPokemons = allPokemons;
  }

  void search(String query) {
    filteredPokemons =
        searchPokemonsUseCase(query: query, allPokemons: allPokemons);
  }
}
