import 'package:pokedex_project/models/pokemon.dart';

class PokemonListStates {}

class HomeInitial extends PokemonListStates {}

class HomeLoading extends PokemonListStates {}

class HomeSuccess extends PokemonListStates {
  HomeSuccess(this.pokemonsList);
  List<Pokemon> pokemonsList;
}

class HomeError extends PokemonListStates {
  HomeError(this.errorMessage);
  String errorMessage;
}
