import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'package:pokedex_project/screens/home/components/poke_card.dart';
import 'package:pokedex_project/services/pokemon_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    getPokemons(1);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Pokédex',
          style: TextStyle(
              //TODO: REMOVE "!"
              color: Theme.of(context).appBarTheme.titleTextStyle!.color,
              fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        width: MediaQuery.of(context).size.width / 1.7,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(
                'Pokédex App',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium!.color),
              ),
            ),
            ListTile(
              onTap: () {
                exit(0);
              },
              tileColor: Colors.grey[800],
              iconColor: Theme.of(context).iconTheme.color,
              leading: const Icon(Icons.exit_to_app_rounded),
              title: Text(
                'Exit',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium!.color),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, int index) {
                  return PokeCard(
                      name: 'Ivysaur',
                      image:
                          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png',
                      id: 3,
                       );
                },
                // childCount: pokemons.length, //TODO: IMPLEMENT CHILD COUNT
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Pokemon> getPokemons(int index) async {
  PokemonService pokemon = PokemonService();
  List<Pokemon> pokemonList = await pokemon.getAll();
  print(pokemonList[index]);
  return pokemonList[index];
}
