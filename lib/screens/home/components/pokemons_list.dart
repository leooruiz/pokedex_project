import 'package:flutter/material.dart';
import 'package:pokedex_project/get_pokemon.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';

import 'poke_card.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({
    super.key,
  });

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  List<Pokemon> pokemons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    pokemonsList();
  }

  void pokemonsList() async {
    pokemons = await getPokemons();
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return CustomScrollView(
      slivers: [
        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (context, int index) {
              return PokeCard(
                pokemon: pokemons[index],
              );
            },
            childCount: pokemons.length,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
        ),
      ],
    );
  }
}
