import 'package:flutter/material.dart';

Color? cardTypeColor(String? type) {
  final Color? color;
  switch (type) {
    case 'fire':
      color = const Color.fromARGB(127, 214, 64, 0);
      break;
    case 'normal':
      color = const Color.fromARGB(129, 255, 175, 63);
      break;
    case 'water':
      color = const Color.fromARGB(121, 80, 150, 255);
      break;
    case 'ghost':
      color = const Color.fromARGB(126, 93, 63, 130);
      break;
    case 'rock':
      color = const Color.fromARGB(125, 120, 120, 0);
      break;
    case 'fighting':
      color = const Color.fromARGB(125, 120, 0, 0);
      break;
    case 'grass':
      color = const Color.fromARGB(125, 0, 169, 11);
      break;
    case 'ice':
      color = const Color.fromARGB(125, 0, 194, 194);
      break;
    case 'psychic':
      color = const Color.fromARGB(125, 170, 0, 91);
      break;
    case 'electric':
      color = const Color.fromARGB(125, 255, 187, 0);
      break;
    case 'bug':
      color = const Color.fromARGB(125, 76, 142, 0);
      break;
    case 'ground':
      color = const Color.fromARGB(125, 245, 127, 23);
      break;
    case 'poison':
      color = const Color.fromARGB(125, 145, 0, 203);
      break;
    case 'flying':
      color = const Color.fromARGB(125, 255, 121, 228);
      break;
    case 'fairy':
      color = const Color.fromARGB(125, 255, 157, 253);
      break;
    case 'steel':
      color = const Color.fromARGB(126, 93, 94, 122);
      break;
    case 'dark':
      color = const Color.fromARGB(123, 113, 69, 30);
      break;
    case 'dragon':
      color = const Color.fromARGB(49, 82, 0, 153);
      break;
    default:
      color = const Color.fromARGB(126, 158, 158, 158);
      break;
  }
  return color;
}
