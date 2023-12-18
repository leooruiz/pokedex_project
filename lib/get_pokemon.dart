import 'package:pokedex_project/pokemons/pokemons.dart';
import 'package:pokedex_project/services/pokemon_service.dart';

Future<List<Map<String, dynamic>>> getPokemons() async {
  PokemonService pokemon = PokemonService();
  List<Pokemon> pokemonList = await pokemon.getAll();
  List<Map<String, dynamic>> mapList = [];
  for (var i = 0; i < pokemonList.length; i++) {
    mapList.add({});
    mapList[i]['name'] =
        pokemonList[i].name.toString(); //todos em formato de string
    mapList[i]['image'] = pokemonList[i].image.toString();
    mapList[i]['id'] = pokemonList[i].id;
    mapList[i]['type1'] = pokemonList[i].type1;
    mapList[i]['type2'] = pokemonList[i].type2;
    mapList[i]['bigImage'] = pokemonList[i].bigImage;
    mapList[i]['hp'] = pokemonList[i].hp;
    mapList[i]['attack'] = pokemonList[i].attack;
    mapList[i]['defense'] = pokemonList[i].defense;
    mapList[i]['specialAttack'] = pokemonList[i].specialAttack;
    mapList[i]['specialDefense'] = pokemonList[i].specialDefense;
    mapList[i]['speed'] = pokemonList[i].speed;
    mapList[i]['height'] = pokemonList[i].height;
    mapList[i]['weight'] = pokemonList[i].weight;
    mapList[i]['move1'] = pokemonList[i].move1;
    mapList[i]['move2'] = pokemonList[i].move2;
  }
  return mapList;
}
