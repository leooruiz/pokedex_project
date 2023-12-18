import 'package:flutter/material.dart';
import 'package:pokedex_project/id_text.dart';
import 'package:pokedex_project/pokemons/pokemons.dart';
import 'package:pokedex_project/theme/card_color.dart';
import 'package:pokedex_project/theme/type_color.dart';

class PokeCard extends StatelessWidget {
  const PokeCard({
    super.key,
    required this.pokemon,
  });
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonNameUpperFirst = pokemon.name.replaceFirst(RegExp(pokemon.name[0]),
                                pokemon.name[0].toUpperCase());              
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            color: cardTypeColor(pokemon.type1.toString()),
            //TODO: MAKE ALL CARDS RESPONSIBLE
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(pokemonNameUpperFirst,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: idText(pokemon,
                              theme: const TextStyle(color: Colors.white38)),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(3),
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                    color: typeColor(pokemon.type1),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  pokemon.type1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              pokemon.type2 != null
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(3),
                                        width: 60,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: typeColor(pokemon.type2),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          pokemon.type2!,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Image.network(
                            pokemon.image,
                            fit: BoxFit.fitHeight,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        // Image.network(image),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, 'details',
                arguments: Pokemon() = pokemon);
          }),
    );
  }
}
