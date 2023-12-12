import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'package:pokedex_project/screens/home/components/poke_card.dart';
import 'package:pokedex_project/services/pokemon_service.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
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
                exit(-1);
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
        child: FutureBuilder(
          //tive dificuldade de lembrar do FutureBuilder
          future: getPokemons(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(child: const Text('Something went wrong'));
            } else {
              List<Map> pokemons = snapshot.data;
              return CustomScrollView(
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, int index) {
                        return PokeCard(
                          name: pokemons[index]['name']!,
                          image: pokemons[index]['image'],
                          id: pokemons[index]['id'],
                        );
                      },
                      childCount: pokemons.length, //TODO: IMPLEMENT CHILD COUNT
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

Future<List<Map<String, dynamic>>> getPokemons() async {
  PokemonService pokemon = PokemonService();
  List<Pokemon> pokemonList = await pokemon.getAll();
  List<Map<String, dynamic>> mapList = [];
  for (var i = 0; i < pokemonList.length; i++) {
    mapList.add({});
    mapList[i]['name'] =
        pokemonList[i].name.toString(); //todos em formato de string
    mapList[i]['image'] = pokemonList[i].image.toString();
    mapList[i]['id'] = pokemonList[i].id;
  }
  return mapList;
}
