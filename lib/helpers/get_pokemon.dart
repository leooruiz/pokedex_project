import 'package:pokedex_project/models/pokemon.dart';
import 'package:pokedex_project/services/pokemon_service.dart';

Future<List<Pokemon>> getPokemons(int pokemonAmount) async {
  PokemonService pokemon = PokemonService();
  return await pokemon.getAll(pokemonAmount);
}
