import 'package:flutter/material.dart';
import 'package:pokedex_project/helpers/helper.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';
import 'package:pokedex_project/screens/details/components/about.dart';
import 'package:pokedex_project/screens/details/components/base_stats.dart';
import 'package:pokedex_project/screens/details/components/types.dart';
import 'package:pokedex_project/theme/type_color.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.pokemon,
  });
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: typeColor(pokemon.type1),
        title: Text(
          pokemonNameUpperFirst(pokemon: pokemon),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child:
                idText(pokemon, theme: Theme.of(context).textTheme.titleLarge),
          )
        ],
      ),
class _DetailsContent extends StatelessWidget {
  const _DetailsContent({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColorDark,
      child: Column(
        children: [
          DescriptionTypes(pokemon: pokemon),
          About(pokemon: pokemon),
          BaseStats(pokemon: pokemon),
        ],
      ),
    );
  }
}
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            color: typeColor(pokemon.type1),
            child: Image.network(
              pokemon.detailsImage,
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Expanded(
            flex: 5,
            child: Container(
              color: Theme.of(context).primaryColorDark,
              child: Column(
                children: [
                  DescriptionTypes(pokemon: pokemon),
                  About(pokemon: pokemon),
                  BaseStats(pokemon: pokemon),
                ],
              ),
            ))
      ]),
    );
  }
}
