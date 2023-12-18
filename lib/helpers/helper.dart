import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';

Text idText(Pokemon pokemon, {TextStyle? theme}) {
  switch (pokemon.id.toString().length) {
    case 1:
      return Text(
        '${pokemon.id}'.padLeft(2, '#00'),
        style: theme,
      );
    case 2:
      return Text(
        '${pokemon.id}'.padLeft(3, '#0'),
        style: theme,
      );
    default:
      return Text(
        '${pokemon.id}'.padLeft(4, '#'),
        style: theme,
      );
  }
}
String pokemonNameUpperFirst(Pokemon pokemon) {
      String name = pokemon.name
          .replaceFirst(RegExp(pokemon.name[0]), pokemon.name[0].toUpperCase());
      return name;
    }