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
              Wordings().pokedexFirstUpper,
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
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        width: MediaQuery.of(context).size.width / 1.7,
        child: ListView(
          children: [
            DrawerHeader(
              child: Text(Wordings().pokedexFirstUpper,
                style: TextStyle(
                    color: Theme.of(context).textTheme.titleMedium!.color),
              ),
            ),
            ListTile(tileColor: Theme.of(context).listTileTheme.tileColor,),
          ],
        ),
      ),
      body: const PokemonsList(),
    );
  }
}


