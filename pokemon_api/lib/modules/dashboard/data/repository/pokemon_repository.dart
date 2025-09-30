import '../../core/domain/model/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons({int limit = 20, int offset = 0});
}
