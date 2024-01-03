import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';

Text idText(Pokemon pokemon, {TextStyle? theme}) {
      return Text(
        '#${pokemon.id.toString().padLeft(3, '0')}',
        style: theme,
      );
}

String pokemonNameUpperFirst({required Pokemon pokemon}) {
  String name = pokemon.name
      .replaceFirst(pokemon.name[0], pokemon.name[0].toUpperCase());
  return name;
}
