import 'package:flutter/material.dart';
import 'package:pokedex_project/get_pokemon.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';

import 'poke_card.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({
    super.key,
  });

  @override
  State<PokemonsList> createState() => _PokemonsListState();
}

class _PokemonsListState extends State<PokemonsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: getPokemons(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).progressIndicatorTheme.color),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('connection to the server was lost'));
          } else {
            List<Map> pokemons = snapshot.data;
            return CustomScrollView(
              slivers: [
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, int index) {
                      return PokeCard(
                        pokemon: Pokemon(
                          name: pokemons[index]['name'],
                          image: pokemons[index]['image'],
                          id: pokemons[index]['id'],
                          type1: pokemons[index]['type1'],
                          type2: pokemons[index]['type2'],
                          bigImage: pokemons[index]['bigImage'],
                          hp: pokemons[index]['hp'],
                          attack: pokemons[index]['attack'],
                          defense: pokemons[index]['defense'],
                          specialAttack: pokemons[index]['specialAttack'],
                          specialDefense: pokemons[index]['specialDefense'],
                          speed: pokemons[index]['speed'],
                          weight: pokemons[index]['weight'],
                          height: pokemons[index]['height'],
                          move1: pokemons[index]['move1'],
                          move2: pokemons[index]['move2'],
                        ),
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
        },
      ),
    );
  }
}
