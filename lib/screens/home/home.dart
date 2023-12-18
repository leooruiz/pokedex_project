import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pokedex_project/screens/home/components/pokemons_list.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  //implement state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        iconTheme: Theme.of(context).appBarTheme.iconTheme,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Row(
          children: [
            Text(
              'Pokédex',
              style: TextStyle(
                  color: Theme.of(context).appBarTheme.titleTextStyle!.color,
                  fontSize: Theme.of(context).textTheme.titleLarge!.fontSize),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Icon(
                Icons.catching_pokemon,
                size: 30,
              ),
            ),
          ],
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
              iconColor: Theme.of(context).iconTheme.color,
              leading: const Icon(Icons.exit_to_app_rounded),
              tileColor: Colors.indigo[700],
              title: Text(
                'Exit',
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium!.color),
              ),
            ),
          ],
        ),
      ),
      body: const PokemonsList(),
    );
  }
}


