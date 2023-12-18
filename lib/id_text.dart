import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';

idText(Pokemon pokemon, {TextStyle? theme}) {
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
