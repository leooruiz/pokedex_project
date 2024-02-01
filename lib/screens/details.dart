import 'package:flutter/material.dart';
import 'package:pokedex_project/helpers/text_functions.dart';
import 'package:pokedex_project/models/pokemon.dart';
import 'package:pokedex_project/screens/components/about.dart';
import 'package:pokedex_project/screens/components/base_stats.dart';
import 'package:pokedex_project/screens/components/types.dart';
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
      body: MediaQuery.of(context).orientation == Orientation.landscape
          ? _LandscapeBody(pokemon: pokemon)
          : _PortraitBody(pokemon: pokemon),
    );
  }
}


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
class _PortraitBody extends StatelessWidget {
  const _PortraitBody({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      Expanded(flex: 5, child: _DetailsContent(pokemon: pokemon))
    ]);
  }
}

class _LandscapeBody extends StatelessWidget {
  const _LandscapeBody({
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Expanded(
        flex: 2,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
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
        child: _DetailsContent(pokemon: pokemon),
      )
    ]);
  }
}
