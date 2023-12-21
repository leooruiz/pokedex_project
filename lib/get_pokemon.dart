import 'package:pokedex_project/pokemon/pokemon.dart';
import 'package:pokedex_project/services/pokemon_service.dart';

Future<List<Pokemon>> getPokemons() async {
  PokemonService pokemon = PokemonService();
  return await pokemon.getAll();
}
