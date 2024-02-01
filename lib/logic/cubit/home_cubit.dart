import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:pokedex_project/helpers/get_pokemon.dart';
import 'package:pokedex_project/logic/cubit/home_states.dart';
import 'package:pokedex_project/models/pokemon.dart';

class HomeCubit extends Cubit<PokemonListStates> {
  HomeCubit() : super(HomeInitial());
  List<Pokemon> pokemons = [];
  getPokemonsList(int pokemonAmount) async {
    emit(HomeLoading());
    try {
      final pokemonsList = await getPokemons(pokemonAmount);
      pokemons.addAll(pokemonsList);
      emit(HomeSuccess(pokemons));
    } on HttpException {
      emit(HomeError('Lost connection to server'));
    } on Exception {
      emit(HomeError('Something went wrong'));
    }
  }
}
