import 'package:flutter/material.dart';
import '../controller/pokemon_controller.dart';
import '../core/domain/usecase/get_pokemons_usecase.dart';
import '../core/domain/usecase/search_pokemon_usecase.dart';
import '../data/repository/pokemon_repository_impl.dart';
import '../core/domain/model/pokemon.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PokemonController controller;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    final repository = PokemonRepositoryImpl();
    controller = PokemonController(
        GetPokemonsUseCase(repository), SearchPokemonsUseCase());
    loadPokemons();
  }

  Future<void> loadPokemons() async {
    setState(() => loading = true);
    await controller.loadPokemons();
    setState(() => loading = false);
  }

  void search(String query) {
    setState(() {
      controller.search(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pokédex")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Buscar Pokémon",
                border: OutlineInputBorder(),
              ),
              onChanged: search,
            ),
          ),
          Expanded(
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : controller.filteredPokemons.isEmpty
                    ? const Center(child: Text("Nenhum Pokémon encontrado"))
                    : ListView.builder(
                        itemCount: controller.filteredPokemons.length,
                        itemBuilder: (context, index) {
                          final pokemon = controller.filteredPokemons[index];
                          return ListTile(
                            leading: Image.network(pokemon.imageUrl),
                            title: Text(pokemon.name),
                            subtitle: Text("#${pokemon.id}"),
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
