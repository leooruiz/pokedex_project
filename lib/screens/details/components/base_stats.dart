import 'package:flutter/material.dart';
import 'package:pokedex_project/helpers/wordings.dart';
import 'package:pokedex_project/pokemon/pokemon.dart';
import 'package:pokedex_project/theme/type_color.dart';

class BaseStats extends StatelessWidget {
  const BaseStats({super.key, required this.pokemon});
  final Pokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            Wordings.baseStats,
            style: TextStyle(
              color: typeColor(pokemon.type1),
              fontSize: 18,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        Wordings.hp,
                        style: TextStyle(color: typeColor(pokemon.type1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        Wordings.atk,
                        style: TextStyle(color: typeColor(pokemon.type1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        Wordings.def,
                        style: TextStyle(color: typeColor(pokemon.type1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        Wordings.satk,
                        style: TextStyle(color: typeColor(pokemon.type1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        Wordings.sdef,
                        style: TextStyle(color: typeColor(pokemon.type1)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Text(
                        Wordings.spd,
                        style: TextStyle(color: typeColor(pokemon.type1)),
                      ),
                    ),
                  ],
                )),
            Container(
              width: 1,
              height: 150,
              color: typeColor(pokemon.type1),
            ),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('${pokemon.hp}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('${pokemon.attack}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('${pokemon.defense}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('${pokemon.specialAttack}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('${pokemon.specialDefense}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text('${pokemon.speed}'),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(5),
                        value: double.parse(pokemon.hp.toString()) / 250,
                        backgroundColor: Colors.white,
                        color: typeColor(pokemon.type1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(5),
                        value: double.parse(pokemon.attack.toString()) / 250,
                        backgroundColor: Colors.white,
                        color: typeColor(pokemon.type1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(5),
                        value: double.parse(pokemon.defense.toString()) / 250,
                        backgroundColor: Colors.white,
                        color: typeColor(pokemon.type1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(5),
                        value: double.parse(pokemon.specialAttack.toString()) /
                            250,
                        backgroundColor: Colors.white,
                        color: typeColor(pokemon.type1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(5),
                        value: double.parse(pokemon.specialDefense.toString()) /
                            250,
                        backgroundColor: Colors.white,
                        color: typeColor(pokemon.type1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(
                        minHeight: 7,
                        borderRadius: BorderRadius.circular(5),
                        value: double.parse(pokemon.speed.toString()) / 250,
                        backgroundColor: Colors.white,
                        color: typeColor(pokemon.type1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
