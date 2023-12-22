import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';

Text idText(Pokemon pokemon, {TextStyle? theme}) {
  switch (pokemon.id.toString().length) {
    case 1:
      return Text(
        '#${pokemon.id.toString().padLeft(2, '00')}',
        style: theme,
      );
    case 2:
      return Text(
        '#${pokemon.id.toString().padLeft(3, '0')}',
        style: theme,
      );
    default:
      return Text(
        '#${pokemon.id}',
        style: theme,
      );
  }
}

String pokemonNameUpperFirst({required Pokemon pokemon}) {
  String name = pokemon.name
      .replaceFirst(RegExp(pokemon.name[0]), pokemon.name[0].toUpperCase());
  return name;
}
