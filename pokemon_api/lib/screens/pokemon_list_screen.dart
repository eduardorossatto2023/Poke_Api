import 'package:flutter/material.dart';
import '../models/pokemon.dart';
import '../services/pokemon_service.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final PokemonService _service = PokemonService();
  List<Pokemon> _pokemons = [];
  List<Pokemon> _filteredPokemons = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  Future<void> _loadPokemons() async {
    try {
      final pokemons = await _service.fetchPokemons();
      setState(() {
        _pokemons = pokemons;
        _filteredPokemons = pokemons;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Erro ao carregar Pokémons")),
      );
    }
  }

  void _filterPokemons(String query) {
    final results = _pokemons
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      _filteredPokemons = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokédex"),
        centerTitle: true,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // Campo de pesquisa
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      labelText: "Pesquisar Pokémon",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: _filterPokemons,
                  ),
                ),

                // Lista / Grid de pokémons
                Expanded(
                  child: _filteredPokemons.isEmpty
                      ? const Center(
                          child: Text(
                            "Nenhum Pokémon encontrado 😢",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
