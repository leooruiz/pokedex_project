import 'package:flutter/material.dart';
import 'package:pokedex_project/helpers/wordings.dart';
import 'package:pokedex_project/models/pokemon.dart';
import 'package:pokedex_project/theme/type_color.dart';

class About extends StatelessWidget {
  const About({super.key, required this.pokemon});

  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
          child: Text(
            Wordings.about,
            style: TextStyle(
              color: typeColor(pokemon.type1),
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          Wordings.weight,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${pokemon.weight} g',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 50,
              color: typeColor(pokemon.type1),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      Wordings.height,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Text(
                    '${pokemon.height}.0 cm',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Container(
              width: 1,
              height: 50,
              color: typeColor(pokemon.type1),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      Wordings.mainMoves,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 3.0),
                    child: Text(
                      pokemon.move1,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  pokemon.move2 != null
                      ? Text(
                          pokemon.move2!,
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
