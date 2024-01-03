import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';

import 'details_type.dart';

class DescriptionTypes extends StatelessWidget {
  const DescriptionTypes({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DetailsType(pokemonType: pokemon.type1),
          DetailsType(pokemonType: pokemon.type2),
        ],
      ),
    );
  }
}
