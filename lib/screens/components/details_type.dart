import 'package:flutter/material.dart';
import 'package:pokedex_project/theme/type_color.dart';

class DetailsType extends StatelessWidget {
  const DetailsType({
    super.key,
    required this.pokemonType,
  });

  final String? pokemonType;

  @override
  Widget build(BuildContext context) {
    if (pokemonType != null) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: typeColor(pokemonType),
                borderRadius: BorderRadius.circular(20),
              ),
              height: 40,
              width: 80,
              alignment: Alignment.center,
              child: Text(
                pokemonType!,
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
