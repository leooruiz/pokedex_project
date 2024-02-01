import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_project/helpers/get_pokemon.dart';
import 'package:pokedex_project/logic/cubit/home_cubit.dart';
import 'package:pokedex_project/logic/cubit/home_states.dart';
import 'package:pokedex_project/models/pokemon.dart';

import 'poke_card.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({
    super.key,
  });

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  // List<Pokemon> pokemons = [];
  // bool isLoading = true;
  // int scrollIndex = 20;
  // final scrollController = ScrollController();
  // bool isFetchingData = false;
  HomeCubit homeCubit = HomeCubit();

  @override
  void initState() {
    super.initState();
    homeCubit.getPokemonsList(20);
    // scrollController.addListener(_scrollListener);
    // pokemonsList();
  }

  // void pokemonsList() async {
  //   if (!isFetchingData) {
  //     setState(() {
  //       isLoading = true;
  //       isFetchingData = true;
  //     });
  //     List<Pokemon> newPokemons = await getPokemons(scrollIndex);
  //     if (newPokemons.isNotEmpty) {
  //       pokemons.addAll(newPokemons);
  //       scrollIndex += 20;
  //     }
  //     isLoading = false;
  //     setState(() {
  //       isFetchingData = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, PokemonListStates>(
      bloc: homeCubit,
      builder: (context, state) {
        if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is HomeSuccess) {
          return CustomScrollView(
            // controller: scrollController,
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, int index) {
                    return PokeCard(
                      pokemon: state.pokemonsList[index],
                    );
                  },
                  childCount: state.pokemonsList.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ],
          );
        } else if (state is HomeError) {
          return Center(child: Text(state.errorMessage));
        }
        return const SizedBox();
      },
    );
  }

  // void _scrollListener() {
  //   if (scrollController.position.maxScrollExtent - 180 <=
  //           scrollController.position.pixels &&
  //       !isFetchingData) {
  //     setState(
  //       () {
  //         scrollIndex + 20;
  //         getPokemons(scrollIndex);
  //       },
  //     );
  //   }
  // }
}
