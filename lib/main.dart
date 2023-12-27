import 'package:flutter/material.dart';
import 'package:pokedex_project/routes/routes.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';
import 'package:pokedex_project/screens/details/details.dart';
import 'package:pokedex_project/theme/my_theme.dart';
import 'screens/home/home.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      initialRoute: Routes.home,
      routes: {
        Routes.home: (context) => const Home(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == Routes.details) {
          final Pokemon pokemon = settings.arguments as Pokemon;
          return MaterialPageRoute(
            builder: (context) {
              return Details(pokemon: pokemon);
            },
          );
        }
        return null;
      },
    );
  }
}
