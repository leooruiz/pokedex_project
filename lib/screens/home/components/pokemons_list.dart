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
  bool isFetchingData = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    pokemonsList();
  }

  void pokemonsList() async {
    //tornar isFetchingData true caso ele for falso e começar funcao
    if (!isFetchingData) {
      setState(() {
        isLoading = true;
        isFetchingData = true;
      });
      List<Pokemon> newPokemons = await getPokemons(scrollIndex);
      if (newPokemons.isNotEmpty) {
        pokemons.addAll(newPokemons);
        scrollIndex += 20;
      }
      isLoading = false;
      setState(() {
        isFetchingData = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty && isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (pokemons.isNotEmpty && isLoading) {
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
          const SliverToBoxAdapter(
              child:
                  Center(heightFactor: 2, child: CircularProgressIndicator())),
        ],
      );
    }
    if (pokemons.isNotEmpty && !isLoading) {
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
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4),
          ),
        ],
      );
    }
    return const Center(child: Text('Lost connection'));
  }

  void _scrollListener() {
    if (scrollController.position.maxScrollExtent - 180 <=
            scrollController.position.pixels &&
        !isFetchingData) {
      pokemonsList();
    }
  }
}
