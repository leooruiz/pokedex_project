import 'package:flutter/material.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'package:pokedex_project/theme/type_color.dart';

class DescriptionTypes extends StatelessWidget {
  const DescriptionTypes({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: typeColor(pokemon.type1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            height: 40,
                            width: 80,
                            alignment: Alignment.center,
                            child: Text(
                              pokemon.type1,
                            ),
                          ),
                        ),
                        pokemon.type2 != null
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: typeColor(pokemon.type2),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  height: 40,
                                  width: 80,
                                  alignment: Alignment.center,
                                  child: Text(pokemon.type2!),
                                ),
                              )
                            : const SizedBox(),
                      ],
                    ),
                  );
  }
}