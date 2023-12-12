import 'package:flutter/material.dart';
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
      home: const Home(),
      routes: {
        'details': (context) => const Details(),
      },
    );
  }
}
