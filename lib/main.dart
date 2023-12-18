import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'package:pokedex_project/screens/details/details.dart';
import 'package:pokedex_project/services/pokemon_service.dart';
import 'package:pokedex_project/theme/my_theme.dart';
import 'screens/home/home.dart';

void main() {
  PokemonService service = PokemonService();
  service.getAll();
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      initialRoute: 'home',
      routes: {
        'home': (context) => const Home(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'details') {
          final Pokemon pokemon = settings.arguments as Pokemon;
          return MaterialPageRoute(
            builder: (context) {
              return Details(
                pokemon: Pokemon(
                  name: pokemon.name,
                  image: pokemon.image,
                  id: pokemon.id,
                  type1: pokemon.type1,
                  type2: pokemon.type2,
                  bigImage: pokemon.bigImage,
                  hp: pokemon.hp,
                  attack: pokemon.attack,
                  defense: pokemon.defense,
                  specialAttack: pokemon.specialAttack,
                  specialDefense: pokemon.specialDefense,
                  speed: pokemon.speed,
                  weight: pokemon.weight,
                  height: pokemon.height,
                  move1: pokemon.move1,
                  move2: pokemon.move2,
                ),
              );
            },
          );
        }
        return null;
      },
    );
  }
}
