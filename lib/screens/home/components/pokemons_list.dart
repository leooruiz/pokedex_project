import 'package:flutter/material.dart';
import 'package:pokedex_project/helpers/get_pokemon.dart';
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
  int scrollIndex = 20;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    pokemonsList();
  }

  void pokemonsList() async {
    // print('counting (${scrollIndex - 19} to $scrollIndex)');
    isLoading = true;
    pokemons += await getPokemons(scrollIndex);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CustomScrollView(
        controller: scrollController,
        slivers:const  [
          SliverToBoxAdapter(child: Center(heightFactor: 12,child: CircularProgressIndicator())),
        ],
      );
    }
    return CustomScrollView(
      controller: scrollController,
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

  void _scrollListener() {
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
    scrollIndex += 20;
      pokemonsList();
    }
  }
}
