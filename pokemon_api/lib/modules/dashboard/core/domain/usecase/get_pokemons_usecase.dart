import '../../domain/model/pokemon.dart';
import '../../../data/repository/pokemon_repository.dart';

class GetPokemonsUseCase {
  final PokemonRepository repository;

  GetPokemonsUseCase(this.repository);

  Future<List<Pokemon>> call() async {
    return await repository.getPokemons();
  }
}
