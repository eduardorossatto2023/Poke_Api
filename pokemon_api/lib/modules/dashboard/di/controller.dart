import '../controller/pokemon_controller.dart';
import '../core/domain/usecase/get_pokemons_usecase.dart';
import '../core/domain/usecase/search_pokemon_usecase.dart';
import '../data/repository/pokemon_repository_impl.dart';

class DashboardDI {
  // Método para criar um PokemonController com todas as dependências
  static PokemonController createController() {
    final repository = PokemonRepositoryImpl();
    final getPokemonsUseCase = GetPokemonsUseCase(repository);
    final searchUseCase = SearchPokemonsUseCase();
    return PokemonController(getPokemonsUseCase, searchUseCase);
  }
}
